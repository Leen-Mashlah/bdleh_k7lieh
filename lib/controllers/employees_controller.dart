import 'package:flutter_web_dashboard/helpers/CacheHelper.dart';
import 'package:flutter_web_dashboard/helpers/dio.dart';
import 'package:flutter_web_dashboard/models/employees_model.dart';
import 'package:get/get.dart';

class EmployeesController extends GetxController {
  EmployeesModel? employeesModel;

  void getemp() {
    DioHelper.getData('employees').then((value) {
      employeesModel = EmployeesModel.fromJson(value?.data);
      print(employeesModel!.data[1].email);
    }).catchError((error) {
      print('error: ' + error.toString());
    });
    update();
  }

  void create_employee(
    String fname,
    String lname,
    String email,
    String phone,
    int employee_of_the_month,
    int salary_id,
    int user_id,
    double salary,
    int grade_id,
    String letter,
    String description,
    double basic_salary,
  ) {
    String token = CacheHelper.get('token');
    DioHelper.postData(
            'employees',
            {
              'first_name': fname,
              'last_name': lname,
              'email': email,
              'phone_number': phone,
              'employee_of_the_month': employee_of_the_month,
              'salary_id': salary_id,
              'user_id': user_id,
              'salary': salary,
              'grade_id': grade_id,
              'letter': letter,
              'description': description,
              'basic_salary': basic_salary,
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
