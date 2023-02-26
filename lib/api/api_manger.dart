import 'dart:convert';

import 'package:get/get_connect/http/src/response/response.dart';
import 'package:http/http.dart' as http;
import 'package:pharmacy/api/models/request/registerRequest.dart';

import '../core/constant.dart';
import 'models/respones/responseRegister.dart';

class API_Manger {

  static Future<ResponseRegister> register(
      String pharmacyName, String email, String Password) async {
    var requestBody = RegisterRequest(
        pharmacyName: pharmacyName, Email: email, Password: Password);
    Uri url = Uri.https(ApiConstanc.BASE_URL, ApiConstanc.Register_URL,{
    'pharmacy_name':pharmacyName,
    'Email':email,
    'Password':Password
      //https://pharmacy-api-1812.onrender.com/api/v1/auth/register?pharmacy_name=ahmed&Email=ahmed11@yahoo.com&Password=1234567

    });
    var response = await http.post(url, body: requestBody.toJson());
    return ResponseRegister.fromJson(jsonDecode(response.body));
  }
///////////////////////////////////////////////////////////////////////
  static Future<ResponseRegister> login(String email, String Password) async {
    Uri url = Uri.https(ApiConstanc.BASE_URL, ApiConstanc.Login_URL,{
      'Email':email,
      'Password':Password
      //pharmacy-api-1812.onrender.com/api/v1/auth/login?Email=mostafa22%40gmail.com&Password=123456789

    });
    var response = await http.post(url);
    try {
      var json = jsonDecode(response.body);
      ResponseRegister responseRegister = ResponseRegister.fromJson(json);
      return responseRegister;
    } catch (e) {
      print('erorrrr:::$e');
      throw e;
    }
  }

}
