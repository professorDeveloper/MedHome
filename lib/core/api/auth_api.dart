import 'package:dio/dio.dart';
import 'package:medhome/core/models/request/auth/login_request.dart';
import 'package:medhome/core/models/request/auth/register_request.dart';
import 'package:medhome/core/models/response/auth/login_response.dart';
import 'package:medhome/core/models/response/auth/register_response.dart';
abstract class AuthApi{
  Future<LoginResponse> login({required LoginRequest loginRequest});
  Future<RegisterResponse> register({required RegisterRequest loginRequest});

}