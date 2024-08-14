class AdminLoginModel {
  bool? status;
  String? message;
  Data? data;

  AdminLoginModel.fromJson(Map<String, dynamic> response) {
    status = response['status'];
    message = response['message'];
    data = response['data'] != null ? Data.fromJson(response['data']) : null;
  }
}

class Data {
  int? id;
  String? name;
  String? email;
  DateTime? emailVerifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<String>? roles;
  List<String>? permissions;
  String? token;

  Data.fromJson(Map<String, dynamic> json) {
    id:
    json['id'];
    name:
    json['name'];
    email:
    json['email'];
    emailVerifiedAt:
    DateTime.parse(json['email_verified_at']);
    createdAt:
    DateTime.parse(json['created_at']);
    updatedAt:
    DateTime.parse(json['updated_at']);
    roles:
    List<String>.from(json['roles']);
    permissions:
    List<String>.from(json['permissions']);
    token:
    json['token'];
  }
}
