import 'package:flutter_web_dashboard/helpers/dio.dart';
import 'package:flutter_web_dashboard/models/reports_f_model.dart';
import 'package:flutter_web_dashboard/models/reports_hr_model.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ReportsController extends GetxController {
  ReportsFModel? reportsFModel;
  void get_reports_f() {
    DioHelper.getData('finance').then((value) {
      reportsFModel = ReportsFModel.fromJson(value?.data['data']);
      update();
    }).catchError((error) {
      print(error.toString());
    });
      update();
  }

    ReportsHRModel? reportsHRModel;
  void get_reports_hr() {
    DioHelper.getData('HR').then((value) {
      reportsHRModel = ReportsHRModel.fromJson(value?.data);
      update();
    }).catchError((error) {
      print(error.toString());
    });
      update();
  }
}
