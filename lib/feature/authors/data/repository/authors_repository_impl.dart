import 'package:postview/core/resources/data_state.dart';

import '../../domain/repository/authors_repository.dart';
import '../datasources/remote/authors_remote_date_source_impl.dart';

class AuthorsRepositoryImpl implements AuthorsRepository {
  final AuthorsRemoteDataSourceImpl authorsRemoteDataSourceImpl;

  AuthorsRepositoryImpl({required this.authorsRemoteDataSourceImpl});

  @override
  Future<DataState> fetchAuthors() async {
    return await authorsRemoteDataSourceImpl.fetchAuthorsList();
  }


}
