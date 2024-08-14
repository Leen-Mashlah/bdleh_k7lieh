class IncentiveShareModel {
  bool? status;
  String? message;
  Data? data;

  IncentiveShareModel.fromJson(Map<String, dynamic> response) {
    status = response['status'];
    message = response['message'];
    data = response['data'] != null ? Data.fromJson(response['data']) : null;
  }
}

class Data {
  String? name;
  String? amountOfShare;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;
  Data.fromJson(Map<String, dynamic> json) {
    name:
    json['name'];
    amountOfShare:
    json['amount_of_share'];
    updatedAt:
    DateTime.parse(json['updated_at']);
    createdAt:
    DateTime.parse(json['created_at']);
    id:
    json['id'];
  }
}
