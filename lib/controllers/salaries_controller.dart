import 'dart:ffi';

import 'package:flutter_web_dashboard/helpers/CacheHelper.dart';
import 'package:flutter_web_dashboard/helpers/dio.dart';
import 'package:flutter_web_dashboard/models/salaries_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SalariesController extends GetxController {
  SalariesModel? salariesModel;
  void get_salary() {
    DioHelper.getData('salary', token: CacheHelper.get('token')).then((value) {
      salariesModel = SalariesModel.fromJson(value?.data);
      if (value?.data['status']) {}
    }).catchError((error) {
      print(error.toString());
    });
  }

  void create_salary(int salary, int grade_id) {
    String token = CacheHelper.get('token');
    DioHelper.postData(
            'salary',
            {
              'salary': salary,
              'grade_id': grade_id,
            },
            token: token)
        .then((value) {
      if (value?.data['status'] == true) {
        salariesModel = SalariesModel.fromJson(value?.data);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  void update_salary(int id, int salary, int grade_id) {
    String token = CacheHelper.get('token');
    DioHelper.postData(
            'salary/${id}',
            {
              'salary': salary,
              'grade_id': grade_id,
            },
            token: token)
        .then((value) {
      if (value?.data['status'] == true) {
        salariesModel = SalariesModel.fromJson(value?.data);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  void del_salary(int id) {
    DioHelper.deleteData('salary/${id}', token: CacheHelper.get('token'))
        .then((value) {
      salariesModel = SalariesModel.fromJson(value?.data);
      if (value?.data['status']) {
        print(value?.data['message']);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  void get_salary_by_id(int id) {
    DioHelper.getData('salary/${id}', token: CacheHelper.get('token'))
        .then((value) {
      salariesModel = SalariesModel.fromJson(value?.data);
      if (value?.data['status']) {}
    }).catchError((error) {
      print(error.toString());
    });
  }
}
