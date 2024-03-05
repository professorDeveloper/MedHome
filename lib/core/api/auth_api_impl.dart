import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:medhome/core/api/auth_api.dart';
import 'package:medhome/core/models/request/auth/login_request.dart';
import 'package:medhome/core/models/request/auth/register_request.dart';
import 'package:medhome/core/models/response/auth/login_response.dart';
import 'package:medhome/core/models/response/auth/register_response.dart';

import '../dio/dio_service.dart';

class AuthApiImpl implements AuthApi {
  final Dio _dio = DioService().getDio();

  @override
  Future<LoginResponse> login({required LoginRequest loginRequest}) async {
    try {
      final response1 = await http.post(
        Uri.parse("${ConstantsAPI.baseUrl}/accounts/token/"),
        body:{
          "phone":"+998992803809",
          "password":"string123"
        }
      );
      if (kDebugMode) {
        print(response1.body);
        print(response1.statusCode);
      }
      if (response1.statusCode == 200) {
        print('Sucess');
      }

      if (response1.statusCode == 200) {
        return LoginResponse();
      } else {
        // If the response is not successful, handle the error
        final errorData = response1.body;

        // Throw an exception with the error message
        throw Exception('Login failed: ');
      }
    } catch (e) {
      // Handle other types of exceptions, e.g., network errors
      throw Exception('Login faileds: $e');
    }
  }

  getQuestionAll() async {}

  @override
  @override
  Future<RegisterResponse> register(
      {required RegisterRequest loginRequest}) async {
    try {
      // Perform register API call using Dio
      final response =
          await _dio.post('/register', data: loginRequest.toJson());

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
  }
}
