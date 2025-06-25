import 'package:dio/dio.dart';

abstract class Result<T> {
  final T? data;
  final DioException? error;

  const Result({this.data, this.error});
}

class Success<T> extends Result<T> {
  const Success(T data) : super(data: data);
}

class Failed<T> extends Result<T> {
  const Failed(DioException error) : super(error: error);
}
