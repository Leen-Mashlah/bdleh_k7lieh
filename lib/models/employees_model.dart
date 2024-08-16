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
    id = json['id'] ?? 0;
    firstName = json['first_name'] ?? '';
    lastName = json['last_name'] ?? '';
    email = json['email'] ?? '';
    phone = json['phone'] ?? '';
    employeeOfTheMonth = json['employee_of_the_month'] ?? 0;
    salaryId = json['salary_id'] ?? 0;
    userId = json['user_id'] ?? 0;
    salary = json['salary'] ?? 0;
    gradeId = json['grade_id'] ?? 0;
    letter = json['letter'] ?? '';
    description = json['description'] ?? '';
    basicSalary = json['basic_salary'] ?? 0;
  }
}
