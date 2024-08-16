class IncentivesModel {
  String? message;
  List<Data> data = [];

  IncentivesModel.fromJson(Map<String, dynamic> json) {
    json['data'].forEach((element) {
      data.add(Data.fromJson(element));
    });
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
    id = json['id'];
    employeeId = json['employee_id'];
    amount = json['amount'];
    pointsAmount = json['points_amount'];
    shareId = json['share_id'];
    date = json['date'];
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }
}
