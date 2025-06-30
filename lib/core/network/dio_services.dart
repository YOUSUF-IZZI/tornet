import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tornet/core/network/api_services.dart';

class RequestCancellationInterceptor extends Interceptor {
  final Map<String, CancelToken> _pendingRequests = {};

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Get the base path without query parameters
    String requestKey = options.path;

    // Cancel previous request to the same endpoint if it exists
    _pendingRequests[requestKey]?.cancel('Cancelled due to new request');

    // Create new cancel token for this request
    final cancelToken = CancelToken();
    _pendingRequests[requestKey] = cancelToken;
    options.cancelToken = cancelToken;

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _removePendingRequest(response.requestOptions);
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (CancelToken.isCancel(err)) {
      // Ignore cancellation errors
      return;
    }
    _removePendingRequest(err.requestOptions);
    handler.next(err);
  }

  void _removePendingRequest(RequestOptions options) {
    // Remove using only the base path
    _pendingRequests.remove(options.path);
  }

  void dispose() {
    // Cancel all pending requests
    for (var token in _pendingRequests.values) {
      token.cancel('Disposed');
    }
    _pendingRequests.clear();
  }
}

class DioServices extends ApiServices {
  static DioServices? _instance;
  final Dio dio;
  final _cancellationInterceptor = RequestCancellationInterceptor();

  // Private constructor
  DioServices._internal(this.dio) {
    //* This is for logging the request and response in the console(pretty dio logging package)
    dio.interceptors.add(
      PrettyDioLogger(
        //* List of things to be print in the console
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 120,
      ),
    );

    // Add request cancellation interceptor
    dio.interceptors.add(_cancellationInterceptor);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (!options.headers.containsKey('Authorization')) {
            // options.headers['Authorization'] = 'Bearer ${await SecureStorage().read(key: AppConstants.accessToken)}';
            //! Change it later, take the token from the secure storage like above.
            options.headers['Authorization'] = 'Bearer 15819|rX7ELUR9o4zNtSfCvAygVYvhTeiPGGBn18gNXotU3d8b99d2';
          }
          return handler.next(options); //continue
        },
      ),
    );
  }

  factory DioServices(Dio dio) {
    _instance ??= DioServices._internal(dio);
    return _instance!;
  }

  //* isFormData Check if the data we want to send as body is from FormData or not(json)
  @override
  Future<dynamic> get(String path, {dynamic data, Map<String, dynamic>? queryParameters, bool isFormData = false, Options? options}) async {
    try {
      final response = await dio.get(path, data: isFormData ? FormData.fromMap(data) : data, queryParameters: queryParameters, options: options);
      return response;
    } on DioException catch (e) {
      debugPrint('DioException: $e');
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> post(String path, {dynamic data, Map<String, dynamic>? queryParameters, bool isFormData = false, Options? options}) async {
    try {
      final response = await dio.post(path, data: isFormData ? FormData.fromMap(data) : data, queryParameters: queryParameters, options: options);
      return response;
    } on DioException catch (e) {
      debugPrint('DioException: $e');
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> patch(String path, {dynamic data, Map<String, dynamic>? queryParameters, bool isFormData = false, Options? options}) async {
    try {
      final response = await dio.patch(path, data: isFormData ? FormData.fromMap(data) : data, queryParameters: queryParameters, options: options);
      return response;
    } on DioException catch (e) {
      debugPrint('DioException: $e');
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> put(String path, {dynamic data, Map<String, dynamic>? queryParameters, bool isFormData = false, Options? options}) async {
    try {
      final response = await dio.put(path, data: isFormData ? FormData.fromMap(data) : data, queryParameters: queryParameters, options: options);
      return response;
    } on DioException catch (e) {
      debugPrint('DioException: $e');
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<dynamic> delete(String path, {dynamic data, Map<String, dynamic>? queryParameters, bool isFormData = false, Options? options}) async {
    try {
      final response = await dio.delete(path, data: isFormData ? FormData.fromMap(data) : data, queryParameters: queryParameters, options: options);
      return response;
    } on DioException catch (e) {
      debugPrint('DioException: $e');
      rethrow;
    } catch (e) {
      rethrow;
    }
  }
}
