import 'package:postview/core/usecase/usecase.dart';

import '../../../../core/resources/data_state.dart';
import '../../data/repository/post_repository_impl.dart';
import '../entity/get_post_by_authors_param.dart';

class GetPostByAuthorsUseCases implements UseCase<DataState, GetPostByAuthorsParam> {
  final PostRepositoryImpl postRepositoryImpl;

  GetPostByAuthorsUseCases({required this.postRepositoryImpl});

  @override
  Future<DataState> call({required GetPostByAuthorsParam params}) {
    return postRepositoryImpl.getPostsByAuthors(userId: params.userID);
  }
}
