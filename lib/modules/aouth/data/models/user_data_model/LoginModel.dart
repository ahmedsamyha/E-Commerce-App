import 'UserData.dart';

class LoginModel {
  LoginModel({
    this.status,
    this.message,
    this.userData,
  });

  LoginModel.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    userData = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
  bool? status;
  String? message;
  UserData? userData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (userData != null) {
      map['data'] = userData?.toJson();
    }
    return map;
  }
}
