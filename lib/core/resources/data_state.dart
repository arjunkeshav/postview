import 'package:dio/dio.dart';

class DataState<T>{
  DataState._();
  factory DataState.success(T value) = SuccessResponse<T>;
  factory DataState.error(T error) = ErrorResponse<T>;
}

class ErrorResponse<DioException> extends DataState<DioException> {
  ErrorResponse(this.error) : super._();
  final DioException error;
}

class SuccessResponse<T> extends DataState<T> {
  SuccessResponse(this.value) : super._();
  final T value;
}