import 'dart:ffi';

import 'package:flutter_web_dashboard/helpers/CacheHelper.dart';
import 'package:flutter_web_dashboard/helpers/dio.dart';
import 'package:flutter_web_dashboard/models/employees_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class EmployeesController extends GetxController {
  EmployeesModel? employeesModel;
  void getemp() {
    DioHelper.getData('employees', token: CacheHelper.get('token'))
        .then((value) {
      employeesModel = EmployeesModel.fromJson(value?.data);
      if (value?.data['status']) {
        //TODO Handle response to Model
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  void create_employee(String fname, String lname, String email, String phone,
      Float salary, int grade_id) {
    String token = CacheHelper.get('token');
    DioHelper.postData(
            'employees',
            {
              'first_name': fname,
              'last_name': lname,
              'email': email,
              'phone_number': phone,
              'salary': salary,
              'grade_id': grade_id,
            },
            token: token)
        .then((value) {
      if (value?.data['status'] == true) {
        employeesModel = EmployeesModel.fromJson(value?.data);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  void update_employee(
    int id,
    String fname,
    String lname,
    String email,
  ) {
    String token = CacheHelper.get('token');
    DioHelper.postData(
            'employees/${id}',
            {
              'first_name': fname,
              'last_name': lname,
              'email': email,
            },
            token: token)
        .then((value) {
      if (value?.data['status'] == true) {
        employeesModel = EmployeesModel.fromJson(value?.data);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  void del_emp(int id) {
    DioHelper.deleteData('employees/${id}', token: CacheHelper.get('token'))
        .then((value) {
      employeesModel = EmployeesModel.fromJson(value?.data);
      if (value?.data['status']) {
        print(value?.data['message']);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }
}
