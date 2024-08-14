import 'package:flutter_web_dashboard/helpers/CacheHelper.dart';
import 'package:flutter_web_dashboard/helpers/dio.dart';
import 'package:flutter_web_dashboard/models/about_us_model.dart';
import 'package:flutter_web_dashboard/models/regulations_maodel.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class AboutUsController extends GetxController {
  AboutUsModel? aboutUsModel;
  void get_about_us() {
    DioHelper.getData('aboutUs', token: CacheHelper.get('token')).then((value) {
      aboutUsModel = AboutUsModel.fromJson(value?.data);
      if (value?.data['status']) {}
    }).catchError((error) {
      print(error.toString());
    });
  }

  void update_about_us(
    String text,
  ) {
    String token = CacheHelper.get('token');
    DioHelper.postData(
            'aboutUs',
            {
              'text': text,
            },
            token: token)
        .then((value) {
      if (value?.data['status'] == true) {
        aboutUsModel = AboutUsModel.fromJson(value?.data);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }
}
