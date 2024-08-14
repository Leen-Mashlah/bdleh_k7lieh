import 'dart:ffi';

import 'package:flutter_web_dashboard/helpers/CacheHelper.dart';
import 'package:flutter_web_dashboard/helpers/dio.dart';
import 'package:flutter_web_dashboard/models/incentive_share_model.dart';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class IncentiveShareController extends GetxController {
  IncentiveShareModel? incentiveShareModel;
  void get_incentive() {
    DioHelper.getData('share', token: CacheHelper.get('token')).then((value) {
      incentiveShareModel = IncentiveShareModel.fromJson(value?.data);
      if (value?.data['status']) {}
    }).catchError((error) {
      print(error.toString());
    });
  }

  void create_incentive_share(
    String name,
    int amount_of_share,
  ) {
    String token = CacheHelper.get('token');
    DioHelper.postData(
            'share',
            {
              'name': name,
              'amount_of_share': amount_of_share,
            },
            token: token)
        .then((value) {
      if (value?.data['status'] == true) {
        incentiveShareModel = IncentiveShareModel.fromJson(value?.data);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  void update_incentive_share(int id, String name, int amount_of_share) {
    String token = CacheHelper.get('token');
    DioHelper.postData(
            'share/${id}', {'name': name, 'amount_of_share': amount_of_share},
            token: token)
        .then((value) {
      if (value?.data['status'] == true) {
        incentiveShareModel = IncentiveShareModel.fromJson(value?.data);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  void del_incentive_share(int id) {
    DioHelper.deleteData('share/${id}', token: CacheHelper.get('token'))
        .then((value) {
      incentiveShareModel = IncentiveShareModel.fromJson(value?.data);
      if (value?.data['status']) {
        print(value?.data['message']);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }
}
