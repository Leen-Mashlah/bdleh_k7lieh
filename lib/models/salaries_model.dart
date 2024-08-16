class SalariesModel {
  bool? status;
  String? message;
  Data? data;

  SalariesModel.fromJson(Map<String, dynamic> response) {
    status = response['status'];
    message = response['message'];
    data = response['data'] != null ? Data.fromJson(response['data']) : null;
  }
}

class Data {
  String? salary;
  String? gradeId;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;
  Data.fromJson(Map<String, dynamic> json) {
    salary = json['salary'];
    gradeId = json['grade_id'];
    updatedAt = DateTime.parse(json['updated_at']);
    createdAt = DateTime.parse(json['created_at']);
    id = json['id'];
  }
}
