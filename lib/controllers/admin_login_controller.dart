import 'dart:convert';

import 'package:flutter_web_dashboard/helpers/CacheHelper.dart';
import 'package:flutter_web_dashboard/helpers/dio.dart';
import 'package:flutter_web_dashboard/models/about_us_model.dart';
import 'package:flutter_web_dashboard/models/admin_login_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart'as http;

import '../constants/api_constant.dart';

class AdminLoginController extends GetxController {
  var isLoading = false.obs;

  var roles='HR'.obs;
  
  
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
  )async {
     isLoading.value = true;
    print("*****************${email}+++++++++++++++++++${password}");
   print("5555555555555555");
                          var headers = {
  'Accept': 'application/json'
};
print("5555555555555555");
var request = http.MultipartRequest('POST', Uri.parse('${baseUrl}adminLogin'));
print("5555555555555555");
request.fields.addAll({
  'email': email,
  'password': password
});

request.headers.addAll(headers);

http.StreamedResponse response = await request.send();

var responsedatat=  await http.Response.fromStream(response);


var bodydecoded=json.decode(responsedatat.body);
 roles =bodydecoded['data']['roles'][0];
print("**************************$roles");

if (response.statusCode == 200) {  
  
  isLoading.value = false;

}
else {
  print("0000000000000000");
  print(response.reasonPhrase);
}


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
