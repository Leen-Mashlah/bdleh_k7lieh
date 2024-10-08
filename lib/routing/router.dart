import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/helpers/pages/Complaints/complaints.dart';
import 'package:flutter_web_dashboard/helpers/pages/Conditions/conditions.dart';
import 'package:flutter_web_dashboard/helpers/pages/Employees/employees.dart';
import 'package:flutter_web_dashboard/helpers/pages/Files/files.dart';
import 'package:flutter_web_dashboard/helpers/pages/Grades/grades.dart';
import 'package:flutter_web_dashboard/helpers/pages/IncentiveShare/incentive_share.dart';
import 'package:flutter_web_dashboard/helpers/pages/Incentives/incentives.dart';
import 'package:flutter_web_dashboard/helpers/pages/Increment/Increment.dart';
import 'package:flutter_web_dashboard/helpers/pages/clients/clients.dart';
import 'package:flutter_web_dashboard/helpers/pages/drivers/drivers.dart';
import 'package:flutter_web_dashboard/helpers/pages/overview/overview.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case employeesPageRoute:
      return _getPageRoute(EmployeesPage());
    case gradesPageRoute:
      return _getPageRoute(GradesPage());
    case incrementPageRoute:
      return _getPageRoute(IncrementPage());
    case complaintsPageRoute:
      return _getPageRoute(ComplaintsPage());
    case conditionsPageRoute:
      return _getPageRoute(ConditionsPage());
    case incentivePageRoute:
      return _getPageRoute(IncentivesPage());
    case incentiveShareRoute:
      return _getPageRoute(IncentivesShare());
    case filesPageRoute:
      return _getPageRoute(FilesPage());
    case overviewPageRoute:
      return _getPageRoute(OverviewPage());
    case driversPageRoute:
      return _getPageRoute(DriversPage());
    case clientsPageRoute:
      return _getPageRoute(ClientsPage());
    default:
      return _getPageRoute(EmployeesPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
