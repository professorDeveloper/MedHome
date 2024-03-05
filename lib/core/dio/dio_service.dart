import 'dart:io';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class DioService {
  Dio getDio() {
    const baseUrl = ConstantsAPI.baseUrl;

    // Create a new Dio instance
    Dio dio = Dio(
      BaseOptions(

        baseUrl: baseUrl,
        followRedirects: true,

      ),
    );
    dio.options.validateStatus = (status) => true;
    const String fingerprint = 'ee5ce1dfa7a53657c545c62b65802e4272878dabd65c0aadcf85783ebb0b4d5c';
    (dio!.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => true;
      return client;
    };

    return dio;
  }
}

class ConstantsAPI {
  static const baseUrl = "http://134.122.89.28:8000/api";
}
