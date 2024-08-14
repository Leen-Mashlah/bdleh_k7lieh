class EmployeesModel {
  bool? status;
  String? message;
  Data? data;

  EmployeesModel.fromJson(Map<String, dynamic> response) {
    status = response['status'];
    message = response['message'];
    data = response['data'] != null ? Data.fromJson(response['data']) : null;
  }
}

class Data {
  int? id;
  String? first_name;
  String? last_name;
  String? email;
  String? phone;
  String? updated_at;
  String? created_at;
  int? salary_id;
  int? employee_of_the_month;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    first_name = json['first_name'];
    last_name = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    updated_at = json['updated_at'];
    created_at = json['created_at'];
    salary_id = json['salary_id'];
    employee_of_the_month = json['employee_of_the_month'];
  }
}
