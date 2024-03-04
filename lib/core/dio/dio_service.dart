import 'package:dio/dio.dart';



class DioService{
  Dio getDio() {
    const baseUrl = ConstantsAPI.baseUrl;

    return Dio(
      BaseOptions(
        baseUrl: baseUrl,
        followRedirects: true

      ),
    );
  }
}

class ConstantsAPI {
  static const baseUrl="http://134.122.89.28:8000/api";
}