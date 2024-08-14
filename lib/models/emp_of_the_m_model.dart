class EmpOfTheMonthModel {
  bool? status;
  String? message;
  Data? data;

  EmpOfTheMonthModel.fromJson(Map<String, dynamic> response) {
    status = response['status'];
    message = response['message'];
    data = response['data'] != null ? Data.fromJson(response['data']) : null;
  }
}

class Data {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  int? employeeOfTheMonth;
  int? salaryId;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  Data.fromJson(Map<String, dynamic> json) {
    id:
    json['id'];
    firstName:
    json['first_name'];
    lastName:
    json['last_name'];
    email:
    json['email'];
    phone:
    json['phone'];
    employeeOfTheMonth:
    json['employee_of_the_month'];
    salaryId:
    json['salary_id'];
    userId:
    json['user_id'];
    createdAt:
    DateTime.parse(json['created_at']);
    updatedAt:
    DateTime.parse(json['updated_at']);
  }
}
