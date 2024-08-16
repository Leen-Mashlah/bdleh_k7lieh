import 'package:flutter_web_dashboard/helpers/CacheHelper.dart';
import 'package:flutter_web_dashboard/helpers/dio.dart';
import 'package:flutter_web_dashboard/models/salary_increment_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SalaryIncrementController extends GetxController {
  SalaryIncrementModel? salaryIncrementModel;

  void create_salary_increment(List<int> employeeIds, int percentage) {
    final requestBody = {
      "increments": employeeIds.map((id) => {"employee_id": id}).toList(),
      "percentage": percentage,
    };
    String token = CacheHelper.get('token');
    DioHelper.postData('increment', requestBody, token: token).then((value) {
      salaryIncrementModel = SalaryIncrementModel.fromJson(value?.data);
    }).catchError((error) {
      print(error.toString());
    });
  }
}
