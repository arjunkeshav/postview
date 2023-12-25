import 'package:postview/core/resources/data_state.dart';
import 'package:postview/core/usecase/usecase.dart';
import 'package:postview/feature/authors/data/repository/authors_repository_impl.dart';

class GetAuthorsListUseCase extends UseCase<DataState,void>{
  final AuthorsRepositoryImpl authorsRepositoryImpl;
  GetAuthorsListUseCase({required this.authorsRepositoryImpl});

  @override
  Future<DataState> call({void params}) {
    return authorsRepositoryImpl.fetchAuthors();
  }

}