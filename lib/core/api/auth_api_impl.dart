import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:medhome/core/api/auth_api.dart';
import 'package:medhome/core/models/request/auth/login_request.dart';
import 'package:medhome/core/models/request/auth/register_request.dart';
import 'package:medhome/core/models/request/auth/send_sms_code_request.dart';
import 'package:medhome/core/models/response/auth/login_response.dart';
import 'package:medhome/core/models/response/auth/send_sms_code_response.dart';

import '../../utils/response.dart';
import '../models/request/verify/verify_request.dart';

class AuthApiImpl implements AuthApi {
  @override
  Future<Result> login({required LoginRequest loginRequest}) async {
    try {
      final response1 = await http.post(
          Uri.parse("${ConstantsAPI.baseUrl}/accounts/token/"),
          body: loginRequest.toJson());
      print(response1.body);

      if (response1.statusCode == 200) {
        print('SUCCESS');
        Map<String, dynamic> jsonMap = json.decode(response1.body);
        var loginResponse = LoginResponse.fromJson(jsonMap);

        // Return a Success result with the login response data
        return Success(loginResponse);
      } else {
        print('ERROR');
        var errorData = json.decode(response1.body);

        return Error(errorData);
      }
    } catch (e) {
      // Handle other types of exceptions, e.g., network errors
      throw Exception(e);
    }
  }

  @override
  Future<Result> register({required RegisterRequest registerRequest}) async{
    try {
      final response = await http.post(
          Uri.parse("${ConstantsAPI.baseUrl}/accounts/register/"),
          body: registerRequest.toJson()
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonMap = json.decode(response.body);
        var registerResponse = SendSmsCodeResponse.fromJson(jsonMap);
        return Success(registerResponse);
      } else {
        var errorData = json.decode(response.body);
        return Error(errorData);
      }
    }catch(e){
      throw Exception(e);}
  }



  @override
  Future<Result> verify({required VerifyRequest request}) async {
    try {
      print(request.toJson());
      String bodyData= jsonEncode({
        "code":request.code,
        "phone":request.phone
      });
      final response = await http.post(
          Uri.parse("${ConstantsAPI.baseUrl}/accounts/verify-code/"),
          headers: {"Content-Type": "application/json"},
          body: bodyData);
      print(response.body);
      if (response.statusCode == 200) {
        print("Tushdii");
        Map<String, dynamic> jsonMap = json.decode(response.body);
        print(jsonMap.toString());
        var verifyResponse = SendSmsCodeResponse.fromJson(jsonMap);
        return Success(verifyResponse);
      } else {
        print("Fail ::::" + response.body);
        var errorResponse =
        SendSmsCodeResponse.fromJson(json.decode(response.body));
        return Error(errorResponse.detail.toString());
      }
    } catch (e) {
      throw Exception(e);
    }

    throw UnimplementedError();
  }

  @override
  Future<Result> sendSmsCodeForRegister(
      {required SendSmsCodeRequest sendSmsCodeRequest}) async {
    try {
      print(sendSmsCodeRequest.toJson());
      final response1 = await http.post(
          Uri.parse("${ConstantsAPI.baseUrl}/accounts/verify-phone/"),
          body: sendSmsCodeRequest.toJson());

      if (response1.statusCode == 200) {
        Map<String, dynamic> jsonMap = json.decode(response1.body);
        var sendSmsResponse = SendSmsCodeResponse.fromJson(jsonMap);

        // Return a Success result with the login response data
        return Success(sendSmsResponse);
      } else {
        // If the response is not successful, handle the error
        var errorResponse =
            SendSmsCodeResponse.fromJson(json.decode(response1.body));

        return Error(errorResponse.detail.toString());
      }
    } catch (e) {
      // Handle other types of exceptions, e.g., network errors
      throw Exception(e);
    }
  }
}
