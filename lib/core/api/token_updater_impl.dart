
import 'dart:convert';

import 'package:medhome/core/api/token_updater.dart';
import 'package:medhome/core/models/request/auth/login_request.dart';
import 'package:medhome/utils/response.dart';
import 'package:http/http.dart' as http;

import '../../utils/my_pref.dart';
import '../models/response/auth/error_response.dart';
import '../models/response/auth/login_response.dart';
import 'auth_api.dart';

class TokenUpdaterImpl implements TokenUpdater{
  Future init() async {
    await Prefs.init();

  }


  @override
  Future<Result> getNewTokens() async {
    init();
    try {
      var phone=Prefs.getUserPhone();
      var password=Prefs.getUserPassword();
      var loginRequest=LoginRequest(phone: phone,password: password);
      final response1 = await http.post(
          Uri.parse("${ConstantsAPI.baseUrl}/accounts/token/"),
          body: loginRequest.toJson());
      print(response1.body);

      if (response1.statusCode == 200) {
        Map<String, dynamic> jsonMap = json.decode(response1.body);
        var loginResponse = LoginResponse.fromJson(jsonMap);
        Prefs.setAccessToken(loginResponse.access);
        Prefs.setRefreshToken(loginResponse.refresh);
        // Return a Success result with the login response data
        return Success(loginResponse);
      }


      else {
        // If the response is not successful, handle the error
        var errorData = json.decode(response1.body);

        return Error(ErrorResponse.fromJson(errorData).detail!);
      }
    } catch (e) {
      // Handle other types of exceptions, e.g., network errors
      throw Exception(e);
    }
  }

  @override
  Future<Result> getNewRefreshToken() {
    // TODO: implement getNewRefreshToken
    throw UnimplementedError();
  }

}