import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_dashboard/constants/components.dart';
import 'package:flutter_web_dashboard/constants/style.dart';

import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/pages/Complaints/components/complaints_table.dart';
import 'package:flutter_web_dashboard/pages/Conditions/components/conditions_table.dart';
import 'package:flutter_web_dashboard/pages/Employees/components/employees_table.dart';

import 'package:flutter_web_dashboard/pages/Employees/components/components.dart';
import 'package:flutter_web_dashboard/pages/overview/widgets/available_drivers_table.dart';

import 'package:get/get.dart';

// ignore: must_be_immutable
class ConditionsPage extends StatelessWidget {
  ConditionsPage({super.key});
  TextEditingController conditiontextcontroller = TextEditingController();
  TextEditingController conditionpointscontroller = TextEditingController();
  ScrollController sc = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            //Obx(
            // () =>
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                    child: Text(
                      'Conditions',
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
                  ConditionsTable(),
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
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      var screenSize = MediaQuery.of(context).size;
                      return Dialog(
                        child: Container(
                          width: screenSize.width * 0.6, // 80% of screen width
                          height:
                              screenSize.height * 0.3, // 50% of screen height
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Add Condition',
                                  style: TextStyle(fontSize: 25),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    SizedBox(
                                      child: TextField(
                                        controller: conditiontextcontroller,
                                        decoration: InputDecoration(
                                          label: Text(
                                            'Condition',
                                          ),
                                        ),
                                      ),
                                      width: screenSize.width * .45,
                                    ),
                                    SizedBox(
                                      child: TextField(
                                        controller: conditionpointscontroller,
                                        decoration: InputDecoration(
                                          label: Text(
                                            'Points',
                                          ),
                                        ),
                                      ),
                                      width: screenSize.width * .05,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Confirm',
                                      style: TextStyle(color: emerald300),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              icon: Icons.add),
        ),
      ],
    );
  }
}
