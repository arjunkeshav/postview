
import '../../../../core/resources/data_state.dart';

abstract class PostRepository {
  Future<DataState> getPosts();
  Future<DataState> getImageForPost({required int postId});
  Future<DataState> getPostsByAuthors({required int userId});

}