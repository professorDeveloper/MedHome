import 'package:dio/dio.dart';
import 'package:medhome/core/api/auth_api.dart';
import 'package:medhome/core/models/request/auth/login_request.dart';
import 'package:medhome/core/models/request/auth/register_request.dart';
import 'package:medhome/core/models/response/auth/login_response.dart';
import 'package:medhome/core/models/response/auth/register_response.dart';

import '../dio/dio_service.dart';

class AuthApiImpl implements AuthApi{
  final Dio _dio = DioService().getDio();
  @override
  Future<LoginResponse> login({required LoginRequest loginRequest}) async{
    try {
      // Perform login API call using Dio
      final response = await _dio.post('/accounts/token', data: loginRequest.toJson(),
        options: Options(

          followRedirects: false,
          // will not throw errors
          validateStatus: (status) => true,
        ),);
      print(response.requestOptions.uri);
      print(response.requestOptions.data);
      // Check for successful response (status code 2xx)
      print(response.data.toString());
      print(response.data.toString());
      if (response.statusCode == 200) {
        return LoginResponse.fromJson(response.data);
      } else {
        // If the response is not successful, handle the error
        final errorData = response.data;
        final errorMessage = errorData['detail'] ?? 'Unknown error';

        // Throw an exception with the error message
        throw Exception('Login failed: $errorMessage');
      }
    } catch (e) {
      // Handle other types of exceptions, e.g., network errors
      throw Exception('Login faileds: $e');
    }
  }

  @override
  @override
  Future<RegisterResponse> register({required RegisterRequest loginRequest}) async {
    try {
      // Perform register API call using Dio
      final response = await _dio.post('/register', data: loginRequest.toJson());

      // Check for successful response (status code 2xx)
      if (response.statusCode == 200) {
        // Parse the response and return a RegisterResponse
        return RegisterResponse.fromJson(response.data);
      } else {
        final errorData = response.data;

        // Check if the error response contains specific fields like "phone" and "password"
        if (errorData.containsKey('phone')) {
          throw Exception('Registration failed: ${errorData['phone'][0]}');
        } else if (errorData.containsKey('password')) {
          throw Exception('Registration failed: ${errorData['password'][0]}');
        } else {
          // Handle other validation errors
          throw Exception('Registration failed: ${errorData.toString()}');
        }
      }
    } catch (e) {
      // Handle other types of exceptions, e.g., network errors
      throw Exception('Registration failed: $e');
    }
  }}