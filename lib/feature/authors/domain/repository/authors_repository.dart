
import '../../../../core/resources/data_state.dart';

abstract class AuthorsRepository {
  Future<DataState> fetchAuthors();
  // Future<DataState> getImageForPost({required int postId});

}