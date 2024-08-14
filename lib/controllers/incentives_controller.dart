import 'package:flutter_web_dashboard/helpers/CacheHelper.dart';
import 'package:flutter_web_dashboard/helpers/dio.dart';
import 'package:flutter_web_dashboard/models/incentives_model.dart';
import 'package:get/get.dart';

class IncentiveController extends GetxController {
  IncentivesModel? incentivesModel;
  void getincentive_byyear() {
    DioHelper.getData('incentives/byYear', token: CacheHelper.get('token'))
        .then((value) {
      if (value?.data['status']) {
        incentivesModel = IncentivesModel.fromJson(value?.data);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  void getincentive() {
    DioHelper.getData('incentives', token: CacheHelper.get('token'))
        .then((value) {
      if (value?.data['status']) {
        incentivesModel = IncentivesModel.fromJson(value?.data);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  void updateProfile(String fname, String lname, String phone) {
    String token = CacheHelper.get('token');
    DioHelper.postData('incentives', {}, token: token).then((value) {
      if (value?.data['status'] == true) {
        //TODO Handle response to Model
      }
    }).catchError((error) {
      print(error.toString());
    });
  }
}
