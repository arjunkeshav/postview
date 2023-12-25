import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:postview/core/client/api_client.dart';
import 'package:postview/feature/posts/domain/entity/post.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../domain/entity/post_image.dart';
import 'image_post_remote_data_source.dart';

class ImagePostRemoteDataSourceImpl extends ImagePostRemoteDataSource{
  @override
  Future<DataState> fetchImages({required int postId}) async {
    try {
      final response = await ApiClient().dio.get('/photos/$postId/');

      if (response.statusCode == 200) {
        return DataState.success(postImageFromJson(jsonEncode(response.data)));
      } else {
        return DataState.error(DioException(
          requestOptions: response.requestOptions,
          error: 'Failed to load images',
        ));
      }
    } catch (e) {
      throw DioException(requestOptions: RequestOptions(path: ''), error: 'Failed to load images');
    }
  }


}