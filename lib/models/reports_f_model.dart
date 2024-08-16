class ReportsFModel {
  double? average_salary;
  String? average_incentives;
  List<Data> data = [];

  ReportsFModel.fromJson(Map<String, dynamic> json) {
    average_salary = json['average_salary'];
    average_salary = json['average_incentives'];
    json['data'].forEach((element) {
      data.add(Data.fromJson(element));
    });
  }
}

class Data {
  int? id;
  String? date;
  String? percentage;
  String? employeeName;
  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    percentage = json['percentage'];
    employeeName = json['employee_name'];
  }
}
