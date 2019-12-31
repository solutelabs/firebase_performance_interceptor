import 'package:firebase_performance/firebase_performance.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:performance_interceptor/utils.dart';

class HttpPerformanceInterceptor implements InterceptorContract {
  HttpMetric metric;

  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    if (data != null) {
      metric = FirebasePerformance.instance.newHttpMetric(
          data.url.toString(), toHttpMethod(methodToString(data.method)));
      await metric.start();
      metric.requestPayloadSize = data.toHttpRequest().contentLength;
    }
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    if (metric != null && data != null) {
      metric.responsePayloadSize = data.contentLength;
      metric.responseContentType = data.headers['Content-Type'];
      metric.httpResponseCode = data.statusCode;
      await metric.stop();
    }
    return data;
  }
}
