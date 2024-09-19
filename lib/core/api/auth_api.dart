import 'package:medhome/core/models/request/auth/login_request.dart';
import 'package:medhome/core/models/request/auth/recieve_password_request.dart';
import 'package:medhome/core/models/request/auth/register_request.dart';
import 'package:medhome/core/models/request/auth/send_sms_code_request.dart';

import '../../utils/response.dart';
import '../models/request/verify/verify_request.dart';

abstract class AuthApi {
  Future<Result> login({required LoginRequest loginRequest});

  Future<Result> register({required RegisterRequest registerRequest});

  Future<Result> verify({required VerifyRequest request});

  Future<Result> sendSmsCodeForRegister(
      {required SendSmsCodeRequest sendSmsCodeRequest});
  Future<Result> sendSmsCodeForForgetPassword(
      {required SendSmsCodeRequest sendSmsCodeRequest});
  Future<Result> recievePassword(
      {required RecievePasswordRequest recievePasswordRequest});

}

class ConstantsAPI {
  static const baseUrl = " /api";
}
