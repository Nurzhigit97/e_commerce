import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

extension Handle on Emitter {
  Future request<T>(
    Future<T> func,
    void Function(T data) onData,
    void Function() onPreProcessing,
    void Function(Object error, StackTrace stackTrace) onError,
  ) async {
    try {
      onPreProcessing.call();
      final data = await func();
      onData(data);
    } on Object catch (e) {
      Error.safeToString(e);
      onError(e, StackTrace.current);
      rethrow;
    }
  }
}
