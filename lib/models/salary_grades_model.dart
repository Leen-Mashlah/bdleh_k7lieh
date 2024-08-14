class SalaryGradesModel {
  bool? status;
  String? message;
  Data? data;

  SalaryGradesModel.fromJson(Map<String, dynamic> response) {
    status = response['status'];
    message = response['message'];
    data = response['data'] != null ? Data.fromJson(response['data']) : null;
  }
}

class Data {
  String? letter;
  String? description;
  String? basicSalary;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Data.fromJson(Map<String, dynamic> json) {
    letter:
    json['letter'];
    description:
    json['description'];
    basicSalary:
    json['basic_salary'];
    updatedAt:
    DateTime.parse(json['updated_at']);
    createdAt:
    DateTime.parse(json['created_at']);
    id:
    json['id'];
  }
}
