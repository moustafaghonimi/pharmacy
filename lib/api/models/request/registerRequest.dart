/// pharmacy_name : "ahmed"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaGFybWFjeUlkIjoiNjNmYTFmNGU5ZDA1YTg3YmM2MjgwNzFkIiwicGhhcm1hY3lOYW1lIjoiYWhtZWQiLCJpYXQiOjE2NzczMzYzOTksImV4cCI6MTY3OTkyODM5OX0.qMVatI8wmlqH8in4IKioddXrqUqLecCk360916reqhU"

class RegisterRequest {
  RegisterRequest({
      this.pharmacyName, 
      this.Email,
      this.Password,

  });

  RegisterRequest.fromJson(dynamic json) {
    pharmacyName = json['pharmacy_name'];
    Email = json['Email'];
    Password = json['Password'];
  }
  String? pharmacyName;
  String? Email;
  String? Password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['pharmacy_name'] = pharmacyName;
    map['Email'] = Email;
    map['Password'] = Password;
    return map;
  }

}