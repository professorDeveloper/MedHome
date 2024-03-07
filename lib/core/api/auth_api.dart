import 'package:dio/dio.dart';
import 'package:medhome/core/models/request/auth/login_request.dart';
import 'package:medhome/core/models/request/auth/register_request.dart';
import 'package:medhome/core/models/request/auth/send_sms_code_request.dart';
import 'package:medhome/core/models/response/auth/login_response.dart';
import 'package:medhome/core/models/response/auth/register_response.dart';
import 'package:medhome/core/models/response/auth/send_sms_code_response.dart';

import '../../utils/response.dart';
abstract class AuthApi{
  Future<Result> login({required LoginRequest loginRequest});
   Future<Result> register({required RegisterRequest registerRequest});
   Future<Result> sendSmsCodeForRegister({required SendSmsCodeRequest sendSmsCodeRequest});

}
class ConstantsAPI {
  static const baseUrl = "https://test.jadidlar.uz/api";
}
