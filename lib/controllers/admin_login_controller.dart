import 'package:flutter_web_dashboard/helpers/CacheHelper.dart';
import 'package:flutter_web_dashboard/helpers/dio.dart';
import 'package:flutter_web_dashboard/models/about_us_model.dart';
import 'package:flutter_web_dashboard/models/admin_login_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AdminLoginController extends GetxController {
  AdminLoginModel? adminLoginModel;
  void get_admin_logout() {
    DioHelper.getData('logout', token: CacheHelper.get('token')).then((value) {
      adminLoginModel = AdminLoginModel.fromJson(value?.data);
      if (value?.data['status']) {}
    }).catchError((error) {
      print(error.toString());
    });
  }

  void admin_login(
    String email,
    String password,
  ) {
    String token = CacheHelper.get('token');
    DioHelper.postData(
            'adminLogin',
            {
              'email': email,
              'password': password,
            },
            token: token)
        .then((value) {
      if (value?.data['status'] == true) {
        adminLoginModel = AdminLoginModel.fromJson(value?.data);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  void change_admin_password(
    String current_password,
    String password,
    String password_confirmation,
  ) {
    String token = CacheHelper.get('token');
    DioHelper.postData(
            'change',
            {
              'current_password': current_password,
              'password': password,
              'password_confirmation': password_confirmation,
            },
            token: token)
        .then((value) {
      if (value?.data['status'] == true) {
        adminLoginModel = AdminLoginModel.fromJson(value?.data);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }
}
