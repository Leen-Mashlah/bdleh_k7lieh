import 'package:flutter_web_dashboard/helpers/CacheHelper.dart';
import 'package:flutter_web_dashboard/helpers/dio.dart';
import 'package:flutter_web_dashboard/models/regulations_maodel.dart';
import 'package:flutter_web_dashboard/models/salary_increment_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SalaryIncrementController extends GetxController {
  SalaryIncrementModel? salaryIncrementModel;

  void create_regulations(
    String name,
  ) {
    String token = CacheHelper.get('token');
    DioHelper.postData(
            'increment',
            {
              'name': name,
            },
            token: token)
        .then((value) {
      if (value?.data['status'] == true) {
        salaryIncrementModel = SalaryIncrementModel.fromJson(value?.data);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }
}
