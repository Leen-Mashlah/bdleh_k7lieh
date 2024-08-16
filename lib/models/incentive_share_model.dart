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
  int? amountOfShare;
  int? id;
  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    amountOfShare = json['amount_of_share'];
    id = json['id'];
  }
}
