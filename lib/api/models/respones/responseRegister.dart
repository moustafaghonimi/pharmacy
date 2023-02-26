/// pharmacy_name : "mo"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaGFybWFjeUlkIjoiNjNmYWE2NTNlYTEzYzgwYWY2MDc2OGE2IiwicGhhcm1hY3lOYW1lIjoibW8iLCJpYXQiOjE2NzczNzEwMzYsImV4cCI6MTY3OTk2MzAzNn0.CKrbyIawPB4322cGTxmFHgQW0cYFR99PGG6lnqSFNNE"

class ResponseRegister {
  ResponseRegister({
      this.pharmacyName,
    this.msg,
    this.token,});

  ResponseRegister.fromJson(dynamic json) {
    pharmacyName = json['pharmacy_name'];
    pharmacyName = json['msg'];
    token = json['token'];
  }
  String? pharmacyName;
  String? msg;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pharmacy_name'] = pharmacyName;
    map['msg'] = msg;
    map['token'] = token;
    return map;
  }

}