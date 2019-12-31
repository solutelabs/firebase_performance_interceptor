import 'package:firebase_performance/firebase_performance.dart';

HttpMethod toHttpMethod(String method) {
  HttpMethod httpMethod = HttpMethod.Get;
  switch (method.toUpperCase()) {
    case "GET":
      httpMethod = HttpMethod.Get;
      break;
    case "POST":
      httpMethod = HttpMethod.Post;
      break;
    case "PUT":
      httpMethod = HttpMethod.Put;
      break;
    case "PATCH":
      httpMethod = HttpMethod.Patch;
      break;
    case "DELETE":
      httpMethod = HttpMethod.Delete;
      break;
  }
  return httpMethod;
}
