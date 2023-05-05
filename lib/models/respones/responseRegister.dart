
class ResponseRegister {
  ResponseRegister({
      this.pharmacyName,
    this.message,
    this.Error,
    this.user,});

  ResponseRegister.fromJson(dynamic json) {
    pharmacyName = json['pharmacy_name'];
    message = json['message'];
    Error = json['Error'];
    user = json['user'];
  }
  String? pharmacyName;
  String? message;
  String? Error;
  String? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pharmacy_name'] = pharmacyName;
    map['message'] = message;
    map['Error'] = Error;
    map['user'] = user;
    return map;
  }

}