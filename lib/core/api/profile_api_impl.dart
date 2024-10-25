import 'dart:convert';

import 'package:medhome/core/api/profile_api.dart';
import 'package:medhome/core/api/token_updater_impl.dart';
import 'package:medhome/core/models/response/home/profile_response.dart';
import 'package:medhome/utils/response.dart';
import 'package:http/http.dart' as http;

import '../../utils/my_pref.dart';
import '../models/response/auth/error_response.dart';
import 'auth_api.dart';
class ProfileApiImp implements ProfileApi{

  @override
  Future<Result> getProfile()async {
    Prefs.init();
    try {
      final response1 = await http.get(
          Uri.parse("${ConstantsAPI.baseUrl}/accounts/profile/"),
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ${Prefs.getAccessToken()}',
          } );
      print(response1.body);

      if (response1.statusCode == 200) {
        Map<String, dynamic> jsonMap = json.decode(response1.body);
        var profileResponse = ProfileResponse.fromJson(jsonMap);


        // Return a Success result with the login response data
        return Success(profileResponse);
      }
      else if(response1.statusCode==401){
        TokenUpdaterImpl().getNewTokens();
        try{
          final response1 = await http.get(
              Uri.parse("${ConstantsAPI.baseUrl}/accounts/token/"),
              headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': 'Bearer ${Prefs.getAccessToken()}',
              } );
          print(response1.body);

          if (response1.statusCode == 200) {
            Map<String, dynamic> jsonMap = json.decode(response1.body);
            var profileResponse = ProfileResponse.fromJson(jsonMap);


            // Return a Success result with the login response data
            return Success(profileResponse);
          }
          else {
            // If the response is not successful, handle the error
            var errorData = json.decode(response1.body);

            return Error(ErrorResponse.fromJson(errorData).detail!);
          }


        }
        catch (e) {
          // Handle other types of exceptions, e.g., network errors
          throw Exception(e);
        }
      }
      else {
     if(response1.statusCode==401){
    TokenUpdaterImpl().getNewTokens();
    try{
    final response1 = await http.get(
    Uri.parse("${ConstantsAPI.baseUrl}/accounts/token/"),
    headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${Prefs.getAccessToken()}',
    } );
    print(response1.body);

    if (response1.statusCode == 200) {
    Map<String, dynamic> jsonMap = json.decode(response1.body);
    var profileResponse = ProfileResponse.fromJson(jsonMap);


    // Return a Success result with the login response data
    return Success(profileResponse);
    }
    else {
    // If the response is not successful, handle the error
    var errorData = json.decode(response1.body);

    return Error(ErrorResponse.fromJson(errorData).detail!);
    }


    }
    catch (e) {
    // Handle other types of exceptions, e.g., network errors
    throw Exception(e);
    }
    }
    // If the response is not successful, handle the error
        else{
       var errorData = json.decode(response1.body);

       return Error(ErrorResponse.fromJson(errorData).detail!);

     }
      }
    } catch (e) {
      // Handle other types of exceptions, e.g., network errors
      throw Exception(e);
    }


  }

}