class SalaryGradesModel {
  String? message;
  List<SalaryGrades> data = [];

  SalaryGradesModel.fromJson(Map<String, dynamic> json) {
    json['data'].forEach((element) {
      data.add(SalaryGrades.fromJson(element));
    });
  }
}

class SalaryGrades {
  String? letter = '';
  String? description = '';
  double? basicSalary = 0;
  //DateTime? updatedAt = DateTime.now();
  //DateTime? createdAt = DateTime.now();
  int? id = 0;

  SalaryGrades.fromJson(Map<String, dynamic> json) {
    letter = json['letter'];
    description = json['description'];
    basicSalary = json['basic_salary'];
    //updatedAt = DateTime.parse(json['updated_at']);
    //createdAt = DateTime.parse(json['created_at']);
    id = json['id'];
  }
}
