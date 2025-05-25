import 'User.dart';
class SignUpResponse {
  SignUpResponse({
      this.message, 
      this.error, 
      this.user, 
      this.token,});

  SignUpResponse.fromJson(dynamic json) {
    message = json['message'];
    error = json['error'];
    user = json['user'] != null ? UserSignUp.fromJson(json['user']) : null;
    token = json['token'];
  }
  String? message;
  String? error;
  UserSignUp? user;
  String? token;

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