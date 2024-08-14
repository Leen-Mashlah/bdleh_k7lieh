import 'package:flutter_web_dashboard/helpers/CacheHelper.dart';
import 'package:flutter_web_dashboard/helpers/dio.dart';
import 'package:flutter_web_dashboard/models/complains_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ComplainsController extends GetxController {
  ComplainsModel? complainsModel;
  void get_complains() {
    DioHelper.getData('complains', token: CacheHelper.get('token'))
        .then((value) {
      complainsModel = ComplainsModel.fromJson(value?.data);
      if (value?.data['status']) {}
    }).catchError((error) {
      print(error.toString());
    });
  }

  void update_complains(
    String complain,
  ) {
    String token = CacheHelper.get('token');
    DioHelper.postData(
            'complains',
            {
              'complain': complain,
            },
            token: token)
        .then((value) {
      if (value?.data['status'] == true) {
        complainsModel = ComplainsModel.fromJson(value?.data);
      }
    }).catchError((error) {
      print(error.toString());
    });
  }
}
