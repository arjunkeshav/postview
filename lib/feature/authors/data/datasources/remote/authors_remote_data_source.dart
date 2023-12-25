
import '../../../../../core/resources/data_state.dart';

abstract class AuthorsRemoteDataSource {
  Future<DataState> fetchAuthorsList();
}