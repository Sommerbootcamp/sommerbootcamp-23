import '../../auth/domain.dart';
import '../../auth/shared.dart';


class Post {

  const Post(this.user_id, this.comment, this.tags, this.image_id, this.image_blur_hash,);

  final String? user_id;
  final String comment;
  final List<String>? tags;
  final String? image_id;
  final String? image_blur_hash;

}
