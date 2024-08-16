class IncentiveShareModel {
  String? message;
  List<Data> data = [];
  IncentiveShareModel.fromJson(Map<String, dynamic> json) {
    json['data'].forEach((element) {
      data.add(Data.fromJson(element));
    });
  }
}

class Data {
  String? name;
  String? amountOfShare;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;
  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amountOfShare = json['amount_of_share'];
    updatedAt = DateTime.parse(json['updated_at']);
    createdAt = DateTime.parse(json['created_at']);
    id = json['id'];
  }
}
