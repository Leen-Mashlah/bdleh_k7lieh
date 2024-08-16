class ReportsHRModel {
  final List<EmployeeOfTheMonth> topThreeEmployeeOfTheMonth;
  final List<MaxEmployeeSalary> maxEmployeeSalary;
  final List<dynamic> maxSupervisorSalary;
  final Complains complains;
  final String message;

  ReportsHRModel({
    required this.topThreeEmployeeOfTheMonth,
    required this.maxEmployeeSalary,
    required this.maxSupervisorSalary,
    required this.complains,
    required this.message,
  });

  factory ReportsHRModel.fromJson(Map<String, dynamic> json) {
    return ReportsHRModel(
      topThreeEmployeeOfTheMonth:
          (json['data']['top_three_employee_of_the_month'] as List)
              .map((i) => EmployeeOfTheMonth.fromJson(i))
              .toList(),
      maxEmployeeSalary: (json['data']['max_employee_salary'] as List)
          .map((i) => MaxEmployeeSalary.fromJson(i))
          .toList(),
      maxSupervisorSalary:
          json['data']['max_supervisor_salary'] as List<dynamic>,
      complains: Complains.fromJson(json['data']['complains']),
      message: json['message'],
    );
  }
}

class EmployeeOfTheMonth {
  final String employeeName;
  final int employeeOfTheMonth;

  EmployeeOfTheMonth({
    required this.employeeName,
    required this.employeeOfTheMonth,
  });

  factory EmployeeOfTheMonth.fromJson(Map<String, dynamic> json) {
    return EmployeeOfTheMonth(
      employeeName: json['employee_name'],
      employeeOfTheMonth: json['employee_of_the_month'],
    );
  }
}

class MaxEmployeeSalary {
  final double maxSalary;
  final String employeeName;
  final String phone;
  final String email;
  final String salaryGrade;

  MaxEmployeeSalary({
    required this.maxSalary,
    required this.employeeName,
    required this.phone,
    required this.email,
    required this.salaryGrade,
  });

  factory MaxEmployeeSalary.fromJson(Map<String, dynamic> json) {
    return MaxEmployeeSalary(
      maxSalary: json['max_salary'],
      employeeName: json['employee_name'],
      phone: json['phone'],
      email: json['email'],
      salaryGrade: json['salary_grade'],
    );
  }
}

class Complains {
  final double complainsRatio;
  final String message;

  Complains({
    required this.complainsRatio,
    required this.message,
  });

  factory Complains.fromJson(Map<String, dynamic> json) {
    return Complains(
      complainsRatio: json['complains_ratio'],
      message: json['message'],
    );
  }
}
