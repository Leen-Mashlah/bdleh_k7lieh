import 'dart:ffi';

import 'package:flutter_web_dashboard/helpers/CacheHelper.dart';
import 'package:flutter_web_dashboard/helpers/dio.dart';

import 'package:flutter_web_dashboard/models/salary_grades_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SalaryGradesController extends GetxController {
  SalaryGradesModel? salarygradesModel;
  void get_salary_grade() {
    DioHelper.getData('grades', token: CacheHelper.get('token')).then((value) {
      salarygradesModel = SalaryGradesModel.fromJson(value?.data);
      if (value?.data['status']) {}
    }).catchError((error) {
      print(error.toString());
    });
  }

  void create_salary_grade(
      String letter, String description, Float basic_salary) {
    String token = CacheHelper.get('token');
    DioHelper.postData(
            'grades',
            {
              'letter': letter,
              'description': description,
              'basic_salary': basic_salary
            },
            token: token)
        .then((value) {
      if (value?.data['status'] == true) {
        salarygradesModel = SalaryGradesModel.fromJson(value?.data);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  void update_salary_grade(
      int id, String letter, String description, Float basic_salary) {
    String token = CacheHelper.get('token');
    DioHelper.postData(
            'grades/${id}',
            {
              'letter': letter,
              'description': description,
              'basic_salary': basic_salary
            },
            token: token)
        .then((value) {
      if (value?.data['status'] == true) {
        salarygradesModel = SalaryGradesModel.fromJson(value?.data);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  void del_salary_grade(int id) {
    DioHelper.deleteData('grades/${id}', token: CacheHelper.get('token'))
        .then((value) {
      salarygradesModel = SalaryGradesModel.fromJson(value?.data);
      if (value?.data['status']) {
        print(value?.data['message']);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }
}
