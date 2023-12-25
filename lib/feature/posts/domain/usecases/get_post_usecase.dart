
import 'package:postview/core/resources/data_state.dart';
import 'package:postview/core/usecase/usecase.dart';
import 'package:postview/feature/posts/data/repository/post_repository_impl.dart';


class GetPostsUseCase implements UseCase<DataState,void> {

  final PostRepositoryImpl postRepositoryImpl;

  GetPostsUseCase({required this.postRepositoryImpl});


  @override
  Future<DataState> call({void params}) {
    return postRepositoryImpl.getPosts();
  }
}