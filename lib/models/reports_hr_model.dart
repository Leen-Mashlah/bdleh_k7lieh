class ReportsHRModel {
  bool? status;
  String? message;
  Data? data;

  ReportsHRModel.fromJson(Map<String, dynamic> response) {
    status = response['status'];
    message = response['message'];
    data = response['data'] != null ? Data.fromJson(response['data']) : null;
  }
}

class Data {
  double? maxSalary;
  String? employeeName;
  String? phone;
  String? email;
  String? salaryGrade;
  Data.fromJson(Map<String, dynamic> json) {
    maxSalary:
    json['max_salary'].toDouble();
    employeeName:
    json['employee_name'];
    phone:
    json['phone'];
    email:
    json['email'];
    salaryGrade:
    json['salary_grade'];
  }
}
