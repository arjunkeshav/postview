


import '../../../../../core/resources/data_state.dart';
import '../../../domain/entity/post_image.dart';

abstract class ImagePostRemoteDataSource {
  Future<DataState> fetchImages({required int postId});
}