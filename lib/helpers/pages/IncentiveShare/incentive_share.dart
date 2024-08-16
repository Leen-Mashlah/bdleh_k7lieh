import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/components.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/helpers/pages/IncentiveShare/components/incentive_share_table.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/helpers/pages/Grades/components/grades_table.dart';

// ignore: must_be_immutable
class IncentivesShare extends StatelessWidget {
  IncentivesShare({super.key});
  TextEditingController searchController = TextEditingController();
  TextEditingController gradenameController = TextEditingController();
  TextEditingController basesalaryController = TextEditingController();
  ScrollController sc = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  'Incentives Share',
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
              IncentivesShareTable(),
            ],
          ),
        ),
      ],
    );
  }
}
