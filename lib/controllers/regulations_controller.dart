import 'package:flutter_web_dashboard/helpers/CacheHelper.dart';
import 'package:flutter_web_dashboard/helpers/dio.dart';
import 'package:flutter_web_dashboard/models/regulations_maodel.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class RegulationsController extends GetxController {
  RegulationsModel? regulationsModel;
  void get_regulations() {
    DioHelper.getData('regulations', token: CacheHelper.get('token'))
        .then((value) {
      regulationsModel = RegulationsModel.fromJson(value?.data);
      if (value?.data['status']) {}
    }).catchError((error) {
      print(error.toString());
    });
  }

  void create_regulations(
    String name,
  ) {
    String token = CacheHelper.get('token');
    DioHelper.postData(
            'regulations',
            {
              'name': name,
            },
            token: token)
        .then((value) {
      if (value?.data['status'] == true) {
        regulationsModel = RegulationsModel.fromJson(value?.data);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  void update_regulations(
    int id,
    String name,
  ) {
    String token = CacheHelper.get('token');
    DioHelper.postData(
            'regulations/${id}',
            {
              'name': name,
            },
            token: token)
        .then((value) {
      if (value?.data['status'] == true) {
        regulationsModel = RegulationsModel.fromJson(value?.data);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }

  void del_regulations(int id) {
    DioHelper.deleteData('regulations/${id}', token: CacheHelper.get('token'))
        .then((value) {
      regulationsModel = RegulationsModel.fromJson(value?.data);
      if (value?.data['status']) {
        print(value?.data['message']);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }
}
