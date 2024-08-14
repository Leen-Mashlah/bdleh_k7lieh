class ComplainsModel {
  bool? status;
  String? message;
  Data? data;

  ComplainsModel.fromJson(Map<String, dynamic> response) {
    status = response['status'];
    message = response['message'];
    data = response['data'] != null ? Data.fromJson(response['data']) : null;
  }
}

class Data {
  int? id;
  String? complain;
  String? date;
  int? employeeId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Data.fromJson(Map<String, dynamic> json) {
    id:
    json['id'];
    complain:
    json['complain'];
    date:
    json['date'];
    employeeId:
    json['employee_id'];
    createdAt:
    json['created_at'] != null ? DateTime.parse(json['created_at']) : null;
    updatedAt:
    json['updated_at'] != null ? DateTime.parse(json['updated_at']) : null;
  }
}
