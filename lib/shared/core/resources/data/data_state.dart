import 'package:dio/dio.dart';

abstract class DataState<T> {
  final T? data;
  final DioException? error;
  final String? nextUrl;

  const DataState({this.data, this.error, this.nextUrl});

  bool get isSuccess => data != null;
}

class DataSuccess<T> extends DataState<T> {
  const DataSuccess(T data, {super.nextUrl}) : super(data: data);
}

class DataFailed<T> extends DataState<T> {
  const DataFailed(DioException error) : super(error: error);
}
