import 'package:flutter_web_dashboard/helpers/CacheHelper.dart';
import 'package:flutter_web_dashboard/helpers/dio.dart';
import 'package:flutter_web_dashboard/models/reports_hr_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ReportsHRController extends GetxController {
  ReportsHRModel? reportsHRModel;
  void get_reports_hr() {
    DioHelper.getData('HR', token: CacheHelper.get('token')).then((value) {
      reportsHRModel = ReportsHRModel.fromJson(value?.data);
      if (value?.data['status']) {}
    }).catchError((error) {
      print(error.toString());
    });
  }
}
