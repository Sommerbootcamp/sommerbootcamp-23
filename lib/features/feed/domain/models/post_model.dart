import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

/// Post Model to persist Data in Backend
@freezed
// ignore_for_file: invalid_annotation_target
class PostModel with _$PostModel {
  /// Create Post Model
  factory PostModel({
    required String comment,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: r'$createdAt') required DateTime createdAt,
    @JsonKey(name: r'$id') String? id,
    @JsonKey(name: 'image_id') String? imageId,
    @JsonKey(name: 'image_blur_hash') String? imageBlurHash,
    List<String>? tags,
  }) = _PostModel;

  /// Convert [PostModel] fromJson
  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
}
