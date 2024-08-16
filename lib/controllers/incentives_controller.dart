import 'package:flutter_web_dashboard/helpers/CacheHelper.dart';
import 'package:flutter_web_dashboard/helpers/dio.dart';
import 'package:flutter_web_dashboard/models/incentives_model.dart';
import 'package:get/get.dart';

class IncentiveController extends GetxController {
  IncentivesModel? incentivesModel;
  void getincentive_byyear() {
    DioHelper.getData('incentives/byYear', token: CacheHelper.get('token'))
        .then((value) {
      incentivesModel = IncentivesModel.fromJson(value?.data);
      update();
    }).catchError((error) {
      print(error.toString());
    });
    update();
  }

  void getincentive() {
    DioHelper.getData(
      'incentives',
    ).then((value) {
      incentivesModel = IncentivesModel.fromJson(value?.data);
      update();
    }).catchError((error) {
      print(error.toString());
    });
    update();
  }

  void distribute(String fname, String lname, String phone) {
    String token = CacheHelper.get('token');
    DioHelper.postData('incentives', {}, token: token).then((value) {
      //TODO Handle response
      update();
    }).catchError((error) {
      print(error.toString());
    });
    update();
  }
}
