import 'package:dio/dio.dart';

import '../constant/constants.dart';

class ApiClient {
  static final ApiClient _singleton = ApiClient._internal();

  factory ApiClient() {
    return _singleton;
  }

  ApiClient._internal() {
    initClient();
  }

  final Dio dio = Dio();

  void initClient() {
    dio.options.baseUrl = baseUrl;
  }
}




// Future<Response> getAllPost() async {
//   return await dio.get('/posts/');
// }
//
// }