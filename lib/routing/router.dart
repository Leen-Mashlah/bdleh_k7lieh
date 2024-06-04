import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/pages/Employees/employees.dart';
import 'package:flutter_web_dashboard/pages/Grades/grades.dart';
import 'package:flutter_web_dashboard/pages/Increment/Increment.dart';
import 'package:flutter_web_dashboard/pages/clients/clients.dart';
import 'package:flutter_web_dashboard/pages/drivers/drivers.dart';
import 'package:flutter_web_dashboard/pages/overview/overview.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case employeesPageRoute:
      return _getPageRoute(EmployeesPage());
    case gradesPageRoute:
      return _getPageRoute(GradesPage());
    case incrementPageRoute:
      return _getPageRoute(IncrementPage());
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
