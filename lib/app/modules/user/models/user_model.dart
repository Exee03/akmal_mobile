class User {
  int? ic;
  String? email;
  String? fcmToken;

  User({this.ic, this.email, this.fcmToken});

  User.fromJson(Map<String, dynamic> json) {
    ic = json['ic'];
    email = json['email'];
    fcmToken = json['fcm_token'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ic'] = ic;
    data['email'] = email;
    data['fcm_token'] = fcmToken;
    return data;
  }
}
