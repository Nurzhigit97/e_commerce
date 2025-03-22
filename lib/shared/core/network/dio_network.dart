import 'package:dio/dio.dart';
import 'package:e_commerce/shared/core/network/logger_interceptor.dart'
    show LoggerInterceptor;
import 'package:e_commerce/shared/core/utils/app_consts.dart';
import 'package:e_commerce/shared/core/utils/log/app_logger.dart';

class DioNetwork {
  static DioNetwork? _instance;
  static Dio? _dio;

  BaseOptions get baseOptions => BaseOptions(
    baseUrl: AppConsts.baseUrl,
    connectTimeout: const Duration(seconds: 15),
    receiveTimeout: const Duration(seconds: 15),
    sendTimeout: const Duration(seconds: 15),
  );

  static Dio get dio {
    _dio ??= _instance?._createDio();
    return _dio!;
  }

  factory DioNetwork() {
    return _instance ??= DioNetwork._internal();
  }

  DioNetwork._internal();

  Dio _createDio() {
    return Dio(baseOptions)
      ..interceptors.addAll([
        _createAuthInterceptor(),
        LoggerInterceptor(
          logger,
          request: true,
          requestBody: true,
          error: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: false,
        ),
      ]);
  }

  InterceptorsWrapper _createAuthInterceptor() {
    return InterceptorsWrapper(
      onRequest: (options, handler) async {
        handler.next(options);
      },
      onError: (error, handler) {
        handler.next(error);
      },
      onResponse: (response, handler) => handler.next(response),
    );
  }
}
