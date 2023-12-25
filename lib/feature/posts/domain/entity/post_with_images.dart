import 'package:postview/feature/posts/domain/entity/post.dart';

class PostWithImage {
  final Posts post;
  final String imageUrl;
  final bool imageLoaded;

  PostWithImage({required this.post, required this.imageUrl,this.imageLoaded =true});
}