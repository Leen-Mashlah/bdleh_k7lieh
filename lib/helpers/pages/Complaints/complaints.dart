import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/components.dart';

import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/helpers/pages/Complaints/components/complaints_table.dart';


import 'package:get/get.dart';

// ignore: must_be_immutable
class ComplaintsPage extends StatelessWidget {
  ComplaintsPage({super.key});
  //TextEditingController searchController = TextEditingController();
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
                      'Complaints',
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
                    ComplaintsTable(),
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
