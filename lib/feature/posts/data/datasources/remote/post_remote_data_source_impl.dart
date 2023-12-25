import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:postview/core/client/api_client.dart';
import 'package:postview/feature/posts/domain/entity/post.dart';

import '../../../../../core/resources/data_state.dart';
import 'post_remote_data_source.dart';

class PostRemoteDataSourceImpl extends PostRemoteDataSource{
  @override
  Future<DataState> fetchPosts() async {
    try {
      final response = await ApiClient().dio.get('/posts');
      if (response.statusCode == 200) {
        return DataState.success(postsFromJson(jsonEncode(response.data)));
      } else {
        throw DataState.error(DioException(
          requestOptions: response.requestOptions,
          error: 'Failed to load posts',
        ));
      }
    } catch (e) {
      throw DioException(requestOptions: RequestOptions(path: ''), error: 'Failed to load posts');
    }
  }

}