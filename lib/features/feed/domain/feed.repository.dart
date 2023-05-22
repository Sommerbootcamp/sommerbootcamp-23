import 'dart:typed_data';

import '../domain.dart' show PostModel;

/// FeedRepository
abstract class FeedRepository {
  /// Create new Post
  Future<void> createPost({
    required String comment,
    List<String>? tags,
    Uint8List? image,
  });

  /// Upload Image to Post Storage
  Future<String> uploadPostImage(
      {required String postId, required Uint8List image});

  /// Get all Posts
  Future<List<PostModel>> getPosts();

  /// Get image from storage
  Future<Uint8List> getImage({
    required String bucketId,
    required String fileId,
    int? width,
    int? height,
    int? quality,
  });
}
