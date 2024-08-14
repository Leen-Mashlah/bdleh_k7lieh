import 'package:flutter_web_dashboard/helpers/CacheHelper.dart';
import 'package:flutter_web_dashboard/helpers/dio.dart';
import 'package:flutter_web_dashboard/models/reports_f_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ReportsFController extends GetxController {
  ReportsFModel? reportsFModel;
  void get_reports_f() {
    DioHelper.getData('finance', token: CacheHelper.get('token')).then((value) {
      reportsFModel = ReportsFModel.fromJson(value?.data);
      if (value?.data['status']) {}
    }).catchError((error) {
      print(error.toString());
    });
  }
}
