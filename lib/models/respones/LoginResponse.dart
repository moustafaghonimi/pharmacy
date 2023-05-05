/// message : "Logged in successfully"
/// authorization : {"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0NTE5ZGU5OGUwMzg1ZDRhZGNmOGVjZiIsInVzZXJfbmFtZSI6Im1vc3RhZmEyMjIiLCJlbWFpbCI6Im1vc3RhZmFnaG9uaW1pMjAyM0BnbWFpbC5jb20iLCJpYXQiOjE2ODMwNzA1NTR9.w1tLwUDIOrhTYOPJ04HBJZaat8fRU9JyGTcY6fY7jyk"}

class LoginResponse {
  LoginResponse({
      this.message, 
      this.Error,
      this.authorization,});

  LoginResponse.fromJson(dynamic json) {
    message = json['message'];
    Error = json['Error'];
    authorization = json['authorization'] != null ? Authorization.fromJson(json['authorization']) : null;
  }
  String? message;
  String? Error;
  Authorization? authorization;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['Error'] = Error;
    if (authorization != null) {
      map['authorization'] = authorization?.toJson();
    }
    return map;
  }

}

/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY0NTE5ZGU5OGUwMzg1ZDRhZGNmOGVjZiIsInVzZXJfbmFtZSI6Im1vc3RhZmEyMjIiLCJlbWFpbCI6Im1vc3RhZmFnaG9uaW1pMjAyM0BnbWFpbC5jb20iLCJpYXQiOjE2ODMwNzA1NTR9.w1tLwUDIOrhTYOPJ04HBJZaat8fRU9JyGTcY6fY7jyk"

class Authorization {
  Authorization({
      this.token,});

  Authorization.fromJson(dynamic json) {
    token = json['token'];
  }
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    return map;
  }

}