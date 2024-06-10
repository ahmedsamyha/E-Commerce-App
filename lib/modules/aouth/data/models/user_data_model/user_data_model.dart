class UserDataModel {
  UserDataModel({
    bool? status,
    String? message,
    Data? data,
  }) {
    _status = status;
    _message = message;
    _data = data;
  }

  UserDataModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
  UserDataModel copyWith({
    bool? status,
    String? message,
    Data? data,
  }) =>
      UserDataModel(
        status: status ?? _status,
        message: message ?? _message,
        data: data ?? _data,
      );
  bool? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// name : "Abdelrahman ALgazzar"
/// phone : "01010238424"
/// email : "ahme654@gmail.com"
/// id : 64115
/// image : "https://student.valuxapps.com/storage/uploads/users/zYlXmkU9e5_1715928666.jpeg"
/// token : "KxxsaC9U445hs0qyLcCuAehz7jKlaYf7tkb35rsDju0koUF5p14vca5wU9HzCqRDjKIhle"

class Data {
  Data({
    String? name,
    String? phone,
    String? email,
    num? id,
    String? image,
    String? token,
  }) {
    _name = name;
    _phone = phone;
    _email = email;
    _id = id;
    _image = image;
    _token = token;
  }

  Data.fromJson(dynamic json) {
    _name = json['name'];
    _phone = json['phone'];
    _email = json['email'];
    _id = json['id'];
    _image = json['image'];
    _token = json['token'];
  }
  String? _name;
  String? _phone;
  String? _email;
  num? _id;
  String? _image;
  String? _token;
  Data copyWith({
    String? name,
    String? phone,
    String? email,
    num? id,
    String? image,
    String? token,
  }) =>
      Data(
        name: name ?? _name,
        phone: phone ?? _phone,
        email: email ?? _email,
        id: id ?? _id,
        image: image ?? _image,
        token: token ?? _token,
      );
  String? get name => _name;
  String? get phone => _phone;
  String? get email => _email;
  num? get id => _id;
  String? get image => _image;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['phone'] = _phone;
    map['email'] = _email;
    map['id'] = _id;
    map['image'] = _image;
    map['token'] = _token;
    return map;
  }
}
