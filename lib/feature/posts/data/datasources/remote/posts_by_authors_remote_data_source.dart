import '../../../../../core/resources/data_state.dart';

abstract class PostsByAuthorsRemoteDatasource {
  Future<DataState> fetchPostsByAuthors ({required int userId});

}
