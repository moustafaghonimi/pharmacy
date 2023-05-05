class ForgetPasswordOtpResponse {
  ForgetPasswordOtpResponse({
      this.status, 
      this.message,});

  ForgetPasswordOtpResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
  }
  String? status;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    return map;
  }

}