import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_dashboard/constants/components.dart';

import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';

import 'package:flutter_web_dashboard/pages/Employees/components/components.dart';
import 'package:flutter_web_dashboard/pages/Grades/available_drivers_table.dart';
import 'package:flutter_web_dashboard/pages/overview/widgets/available_drivers_table.dart';

import 'package:get/get.dart';

// ignore: must_be_immutable
class GradesPage extends StatelessWidget {
  GradesPage({super.key});
  TextEditingController searchController = TextEditingController();
  //Scroll sc = Get.put(Scroll());
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
                    // child: CustomText(
                    //   text: menuController.activeItem.value,
                    //   size: 24,
                    //   weight: FontWeight.bold,
                    // )),
                    child: Text(
                      'Grades',
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
                  const GradesTable(),
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
