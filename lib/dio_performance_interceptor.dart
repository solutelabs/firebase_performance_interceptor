import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:performance_interceptor/utils.dart';

class DioPerformanceInterceptor implements InterceptorsWrapper {
  HttpMetric metric;

  @override
  Future onRequest(RequestOptions options) async {
    metric = FirebasePerformance.instance.newHttpMetric(
      '${options.baseUrl}${options.path}',
      toHttpMethod(options.method),
    );
    await metric.start();
    return null;
  }

  @override
  Future onResponse(Response response) async {
    await _setResponse(response);
    return null;
  }

  @override
  Future onError(DioError err) async {
    await _setResponse(err.response);
    return null;
  }

  Future<void> _setResponse(Response response) async {
    try {
      metric.responseContentType =
          response.headers.map[HttpHeaders.contentTypeHeader].first;
    } catch (_) {}
    metric.httpResponseCode = response.statusCode;
    await metric.stop();
  }
}
