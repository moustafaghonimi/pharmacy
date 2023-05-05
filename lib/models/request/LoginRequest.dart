class LoginRequest {
  LoginRequest({
    this.pharId,
    this.otp,
    this.email,
    this.password,});

  LoginRequest.fromJson(dynamic json) {
    pharId = json['pharId'];
    email = json['email'];
    password = json['password'];
    otp = json['otp'];
  }
  String? pharId;
  String? email;
  String? password;
  String? otp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pharId'] = pharId;
    map['email'] = email;
    map['password'] = password;
    map['otp'] = otp;
    return map;
  }

}