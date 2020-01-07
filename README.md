# HTTP Performance Interceptors

## Introduction
[Firebase Peformance Monitor](https://firebase.google.com/docs/perf-mon) implementation for Flutter.

It can monitor HTTP requests response time and success/failure rates.

This packages has performance monitor interceptors for [http](https://pub.dev/packages/http) and [dio](https://pub.dev/packages/dio)

## Installation
```
performance_interceptor:
    git:
      url: git@github.com:solutelabs/firebase_performance_interceptor.git
```

## Usage

### For HTTP Client
```
import 'package:http_interceptor/http_interceptor.dart';
import 'package:performance_interceptor/performance_interceptor.dart';

...


final url = 'https://jsonplaceholder.typicode.com/photos';
final client = HttpClientWithInterceptor.build(
                      interceptors: [
                        HttpPerformanceInterceptor(),
                      ],
                    );
await client.get(url);
```

### For Dio Client

```
import 'package:performance_interceptor/performance_interceptor.dart';

...

final dio = Dio();
dio.interceptors.add(DioPerformanceInterceptor());
await dio.get(url);
```