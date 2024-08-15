class EmployeesModel {
  String? message;
  List<Employee> data = [];

  EmployeesModel.fromJson(Map<String, dynamic> json) {
    json['data'].forEach((element) {
      data.add(Employee.fromJson(element));
    });
  }
}

class Employee {
  int? id = 0;
  String? firstName = '';
  String? lastName = '';
  String? email = '';
  String? phone = '';
  int? employeeOfTheMonth = 0;
  int? salaryId = 0;
  int? userId = 0;
  double? salary = 0;
  int? gradeId = 0;
  String? letter = '';
  String? description = '';
  double? basicSalary = 0;
  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    phone = json['phone'];
    employeeOfTheMonth = json['employee_of_the_month'];
    salaryId = json['salary_id'];
    userId = json['user_id'];
    salary = json['salary'];
    gradeId = json['grade_id'];
    letter = json['letter'];
    description = json['description'];
    basicSalary = json['basic_salary'];
  }
}
