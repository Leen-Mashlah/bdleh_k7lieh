class IncentivesModel {
  bool? status;
  String? message;
  Data? data;

  IncentivesModel.fromJson(Map<String, dynamic> response) {
    status = response['status'];
    message = response['message'];
    data = response['data'] != null ? Data.fromJson(response['data']) : null;
  }
}

class Data {
  int? id;
  int? employeeId;
  String? amount;
  int? pointsAmount;
  int? shareId;
  String? date;
  DateTime? createdAt;
  DateTime? updatedAt;
  Data.fromJson(Map<String, dynamic> json) {
    id:
    json['id'];
    employeeId:
    json['employee_id'];
    amount:
    json['amount'];
    pointsAmount:
    json['points_amount'];
    shareId:
    json['share_id'];
    date:
    json['date'];
    createdAt:
    DateTime.parse(json['created_at']);
    updatedAt:
    DateTime.parse(json['updated_at']);
  }
}
