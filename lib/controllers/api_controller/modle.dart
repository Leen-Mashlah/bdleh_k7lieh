class Complain {
  List<Data>? data;
  String? message;

  Complain({this.data, this.message});

  Complain.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? id;
  String? complain;
  String? date;
  int? employeeId;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.complain,
      this.date,
      this.employeeId,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    complain = json['complain'];
    date = json['date'];
    employeeId = json['employee_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['complain'] = this.complain;
    data['date'] = this.date;
    data['employee_id'] = this.employeeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
