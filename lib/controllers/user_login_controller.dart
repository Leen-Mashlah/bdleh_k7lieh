import 'package:flutter_web_dashboard/helpers/CacheHelper.dart';
import 'package:flutter_web_dashboard/helpers/dio.dart';
import 'package:flutter_web_dashboard/models/admin_login_model.dart';
import 'package:flutter_web_dashboard/models/login_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class UserLoginController extends GetxController {
  UserLoginModel? userLoginModel;
  void get_user_logout() {
    DioHelper.getData('logout', token: CacheHelper.get('token')).then((value) {
      userLoginModel = UserLoginModel.fromJson(value?.data);
      if (value?.data['status']) {}
    }).catchError((error) {
      print(error.toString());
    });
  }

  void user_login(
    String email,
    String password,
  ) {
    String token = CacheHelper.get('token');
    DioHelper.postData(
            'userLogin',
            {
              'email': email,
              'password': password,
            },
            token: token)
        .then((value) {
      if (value?.data['status'] == true) {
        userLoginModel = UserLoginModel.fromJson(value?.data);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  void change_user_password(
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
        userLoginModel = UserLoginModel.fromJson(value?.data);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }
}
