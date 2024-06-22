import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_dashboard/constants/components.dart';
import 'package:flutter_web_dashboard/helpers/pages/Incentives/components/components.dart';

import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/helpers/pages/Employees/components/employees_table.dart';

import 'package:flutter_web_dashboard/helpers/pages/Incentives/components/incentives_table.dart';
import 'package:flutter_web_dashboard/helpers/pages/overview/widgets/available_drivers_table.dart';

import 'package:get/get.dart';

// ignore: must_be_immutable
class IncentivesPage extends StatelessWidget {
  IncentivesPage({super.key});
  TextEditingController searchController = TextEditingController();
  //Scroll sc = Get.put(Scroll());
  ScrollController sc = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                    child: Text(
                      'Incentives',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ))
              ],
            ),
            Expanded(
              child: ListView(
                controller: sc,
                children: [
                  Actionsbar(searchController, context),
                  IncentivesTable(),
                ],
              ),
            ),
          ],
        ),
        Positioned.directional(
          textDirection: TextDirection.ltr,
          bottom: 20,
          end: 20,
          child: MyFloatButton(
              onTap: () {
                sc.animateTo(
                  0.0,
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
                ;
              },
              icon: Icons.arrow_upward),
        ),
      ],
    );
  }
}
