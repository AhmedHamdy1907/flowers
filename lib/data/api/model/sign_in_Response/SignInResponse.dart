import 'User.dart';
class SignInResponse {
  String? message;
  UserSignIn? user;
  String? token;
  String? error;
  SignInResponse({
    this.error,
    this.message,
      this.user, 
      this.token,});

  SignInResponse.fromJson(dynamic json) {
    error = json['error'];
    message = json['message'];
    user = json['user'] != null ? UserSignIn.fromJson(json['user']) : null;
    token = json['token'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['error'] = error;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    map['token'] = token;
    return map;
  }

}