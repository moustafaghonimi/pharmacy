

import '../../models/respones/ForgetPasswordOTP_Response.dart';
import '../../models/respones/LoginResponse.dart';
import '../../models/respones/responseRegister.dart';
import '../base_Repo.dart';
import 'package:http/http.dart' as http;


class LocalDB implements BaseRepositorie{
  @override
  Future<ForgetPasswordOtpResponse> forgetPasswordOTP(String email) {
    // TODO: implement forgetPasswordOTP
    throw UnimplementedError();
  }

  @override
  Future<LoginResponse> login(String id, String Email, String Password) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future<ResponseRegister> register(String pharId, String pharName, String userName, String firstName, String lastName, String email, String password, String cPassword, String age, String phone) {
    // TODO: implement register
    throw UnimplementedError();
  }

  @override
  Future<ForgetPasswordOtpResponse> resetPassword(String otp, String pass, String email) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }


}