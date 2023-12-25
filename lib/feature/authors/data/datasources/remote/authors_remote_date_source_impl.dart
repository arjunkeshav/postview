import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:postview/core/client/api_client.dart';

import '../../../../../core/resources/data_state.dart';
import '../../../domain/enitity/authors_details.dart';
import 'authors_remote_data_source.dart';

class AuthorsRemoteDataSourceImpl extends AuthorsRemoteDataSource{
  @override
  Future<DataState> fetchAuthorsList() async {
    try {
      final response = await ApiClient().dio.get('/users/');
      if (response.statusCode == 200) {
        return DataState.success(authorsDetailsFromJson(jsonEncode(response.data)));
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