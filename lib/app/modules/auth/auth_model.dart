class Auth {
  String? email;
  String? password;
  String? phone;

  Auth({this.email, this.password, this.phone});

  Auth.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['password'] = password;
    data['phone'] = phone;
    return data;
  }
}
