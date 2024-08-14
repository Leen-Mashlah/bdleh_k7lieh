class AboutUsModel {
  bool? status;
  String? message;
  Data? data;

  AboutUsModel.fromJson(Map<String, dynamic> response) {
    status = response['status'];
    message = response['message'];
    data = response['data'] != null ? Data.fromJson(response['data']) : null;
  }
}

class Data {
  int? id;
  String? text;
  int? employeeId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Data.fromJson(Map<String, dynamic> json) {
    id:
    json['id'];
    text:
    json['text'];
    employeeId:
    json['employee_id'];
    createdAt:
    json['created_at'] != null ? DateTime.parse(json['created_at']) : null;
    updatedAt:
    json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null;
  }
}
