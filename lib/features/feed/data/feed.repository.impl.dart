import 'package:appwrite/appwrite.dart';
import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;
import 'package:uuid/uuid.dart';

import '../../auth/domain/auth.repository.dart';
import '../../core/shared.dart';
import '../domain.dart';

/// Implementation for [FeedRepository]
class FeedRepositoryImpl implements FeedRepository {
  /// constructor
  FeedRepositoryImpl({
    required this.appwriteClient,
    required this.authRepository,
  });

  /// Appwrite Client
  final AppwriteClient appwriteClient;

  /// Auth Repository
  final AuthRepository authRepository;
  final Uuid _uuid = const Uuid();

  @override
  Future<String> uploadPostImage({
    required String postId,
    required Uint8List image,
  }) async {
    final file = await appwriteClient.storage.createFile(
      bucketId: appwriteClient.postsBucketId,
      fileId: _uuid.v1(),
      file: InputFile.fromBytes(
        bytes: image,
        filename: postId,
      ),
    );
    return file.$id;
  }

  @override
  Future<void> createPost({
    required String comment,
    List<String>? tags,
    Uint8List? image,
  }) async {
    final postId = _uuid.v1();
    String? imageId;
    String? imageBlurHash;
    if (null != image) {
      imageId = await uploadPostImage(postId: postId, image: image);
      final blurImage = img.decodeImage(image);
      debugPrint('Upload Image height: ${blurImage?.height}');
      debugPrint('Upload Image width: ${blurImage?.width}');
      imageBlurHash = BlurHash.encode(blurImage!).hash;
    }

    // TODO(team): lege eine Model Klasse an. Aktuell hat die Variable data
    // unten den Typ Map<String, dynamic>. Erkundige dich auch gerne was eine
    // Map ist.
    final data = <String, dynamic>{
      'user_id': authRepository.currentUser?.$id,
      'comment': comment,
      'tags': tags,
      'image_id': imageId,
      'image_blur_hash': imageBlurHash,
    };

    try {
      await appwriteClient.databases.createDocument(
          databaseId: appwriteClient.databaseId,
          collectionId: appwriteClient.postCollectionId,
          documentId: postId,
          data: data,
          permissions: [
            Permission.read(Role.users()),
            Permission.update(Role.user(authRepository.currentUser!.$id)),
            Permission.delete(Role.user(authRepository.currentUser!.$id)),
          ]);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<List<PostModel>> getPosts() async {
    final posts = await appwriteClient.databases.listDocuments(
      databaseId: appwriteClient.databaseId,
      collectionId: appwriteClient.postCollectionId,
    );

    final postModels = posts.convertTo(
      (p0) => PostModel.fromJson(p0 as Map<String, dynamic>),
    )..sort((a, b) => b.createdAt.compareTo(a.createdAt));

    return postModels;
  }

  @override
  Future<Uint8List> getImage({
    required String bucketId,
    required String fileId,
    int? width,
    int? height,
    int? quality,
  }) async {
    final image = await appwriteClient.storage.getFilePreview(
      bucketId: bucketId,
      fileId: fileId,
      width: width,
      height: height,
      quality: quality,
    );
    return image;
  }
}
