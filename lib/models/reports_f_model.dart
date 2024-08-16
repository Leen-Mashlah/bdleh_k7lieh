class ReportsFModel {
  bool? status;
  String? message;
  Data? data;

  ReportsFModel.fromJson(Map<String, dynamic> response) {
    message = response['message'];
    data = response['data'] != null ? Data.fromJson(response['data']) : null;
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
