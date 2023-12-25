import 'package:postview/core/resources/data_state.dart';
import 'package:postview/core/usecase/usecase.dart';
import 'package:postview/feature/posts/data/repository/post_repository_impl.dart';
import 'package:postview/feature/posts/domain/entity/get_image_params.dart';

class GetImagePostUseCase implements UseCase<DataState, GetImageParams> {
  final PostRepositoryImpl postRepositoryImpl;

  GetImagePostUseCase({required this.postRepositoryImpl});

  @override
  Future<DataState> call({required GetImageParams params}) {
    return postRepositoryImpl.getImageForPost(postId: params.postId);
  }
}
