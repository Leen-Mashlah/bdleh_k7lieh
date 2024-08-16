class RegulationsModel {
  bool? status;
  String? message;
  Data? data;

  RegulationsModel.fromJson(Map<String, dynamic> response) {
    status = response['status'];
    message = response['message'];
    data = response['data'] != null ? Data.fromJson(response['data']) : null;
  }
}

class Data {
  int? id;
  String? name;
  double? points;
  DateTime? createdAt;
  DateTime? updatedAt;
  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    points = (json['points'] as num).toDouble(); // Convert to double
    createdAt = DateTime.parse(json['created_at']);
    updatedAt = DateTime.parse(json['updated_at']);
  }
}
