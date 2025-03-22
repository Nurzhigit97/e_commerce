import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/base_state.dart';

extension EmitterExtensions<T extends BaseState> on Emitter<T> {
  Future<void> handle<D>({
    required Future<D> Function() action,
    required T Function(D data) onData,
    required T Function() onLoading,
    required T Function(String error) onError,
  }) async {
    try {
      call(onLoading());
      final data = await action();
      call(onData(data));
    } on DioException catch (e) {
      call(onError(e.message ?? 'Unknown error'));
    }
  }
}
