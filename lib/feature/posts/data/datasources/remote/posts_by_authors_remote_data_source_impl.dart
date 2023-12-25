import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:postview/core/client/api_client.dart';
import 'package:postview/core/resources/data_state.dart';

import '../../../domain/entity/post.dart';
import 'posts_by_authors_remote_data_source.dart';

class PostsByAuthorsRemoteDataSourceImpl extends PostsByAuthorsRemoteDatasource {
  @override
  Future<DataState> fetchPostsByAuthors({required int userId}) async {
    try {
      final response = await ApiClient().dio.get('/users/$userId/posts');
      if (response.statusCode == 200) {
        return DataState.success(postsFromJson(jsonEncode(response.data)));
      } else {
        return DataState.error(DioException(
          requestOptions: response.requestOptions,
          error: 'Failed to load posts by authors',
        ));
      }
    } catch (e) {
      throw DioException(
        requestOptions: RequestOptions(path: ''),
        error: 'Failed to load posts by authors',
      );
    }
  }
}
