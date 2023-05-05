class RegisterRequest {
  String? pharId;
  String? pharName;
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? cPassword;
  String? age;
  String? phone;

  RegisterRequest(
      {this.pharId,
        this.pharName,
        this.userName,
        this.firstName,
        this.lastName,
        this.email,
        this.password,
        this.cPassword,
        this.age,
        this.phone});

  RegisterRequest.fromJson(Map<String, dynamic> json) {
    pharId = json['pharId'];
    pharName = json['pharName'];
    userName = json['userName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    cPassword = json['cPassword'];
    age = json['age']  ;
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pharId'] = this.pharId;
    data['pharName'] = this.pharName;
    data['userName'] = this.userName;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['cPassword'] = this.cPassword;
    data['age'] = this.age ;
    data['phone'] = this.phone;
    return data;
  }
}