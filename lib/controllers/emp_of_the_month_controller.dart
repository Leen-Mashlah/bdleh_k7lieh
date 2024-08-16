import 'package:flutter_web_dashboard/helpers/CacheHelper.dart';
import 'package:flutter_web_dashboard/helpers/dio.dart';
import 'package:flutter_web_dashboard/models/emp_of_the_m_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class EmpOfTheMonthController extends GetxController {
  EmpOfTheMonthModel? empOfTheMonthModel;
  void get_emp_of_the_month() {
    DioHelper.getData('empOfTheMonth', token: CacheHelper.get('token'))
        .then((value) {
      empOfTheMonthModel = EmpOfTheMonthModel.fromJson(value?.data);
      if (value?.data['status']) {}
    }).catchError((error) {
      print(error.toString());
    });
  }

  void get_top_emp_of_the_month(int id) {
    DioHelper.getData('empOfTheMonth/${id}', token: CacheHelper.get('token'))
        .then((value) {
      empOfTheMonthModel = EmpOfTheMonthModel.fromJson(value?.data);
      if (value?.data['status']) {}
    }).catchError((error) {
      print(error.toString());
    });
  }

  void add_emp_of_the_month(
    int employee_id,
  ) {
    String token = CacheHelper.get('token');
    DioHelper.postData(
            'empOfTheMonth',
            {
              'employee_id,': employee_id,
            },
            token: token)
        .then((value) {
      if (value?.data['status'] == true) {
        empOfTheMonthModel = EmpOfTheMonthModel.fromJson(value?.data);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }
}
