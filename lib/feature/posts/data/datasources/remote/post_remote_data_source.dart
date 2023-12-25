

import 'package:postview/feature/posts/domain/entity/post.dart';

import '../../../../../core/resources/data_state.dart';

abstract class PostRemoteDataSource {
  Future<DataState> fetchPosts();
}