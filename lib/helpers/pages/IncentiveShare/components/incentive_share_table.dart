import 'package:buildcondition/buildcondition.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/controllers/incentive_share_controller.dart';
import 'package:flutter_web_dashboard/controllers/salary_grades_controller.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

/// Example without datasource
class IncentivesShareTable extends StatelessWidget {
  //const
  IncentivesShareTable({super.key});

  IncentiveShareController controller = Get.put(IncentiveShareController());

  TextEditingController gradecontroller = new TextEditingController();
  TextEditingController descriptioncontroller = new TextEditingController();
  TextEditingController basesalaryontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    controller.get_incentive();
    return GetBuilder(
      init: controller,
      builder: (controller) => BuildCondition(
        condition: controller.incentiveShareModel != null,
        fallback: (context) => Center(child: CircularProgressIndicator()),
        builder: (context) => Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: active.withOpacity(.4), width: .5),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 6),
                  color: lightGrey.withOpacity(.1),
                  blurRadius: 12)
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.all(16),
          margin: const EdgeInsets.only(bottom: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Row(
                  // children: [
                  //   SizedBox(
                  //     width: 10,
                  //   ),
                  //   CustomText(
                  //     text: "Available Drivers",
                  //     color: lightGrey,
                  //     weight: FontWeight.bold,
                  //   ),
                  //],
                  ),
              SizedBox(
                  height: (56 * 5) + 40,
                  child: DataTable2(
                      columnSpacing: 12,
                      dataRowHeight: 56,
                      headingRowHeight: 40,
                      horizontalMargin: 12,
                      minWidth: 600,
                      columns: const [
                        DataColumn2(
                          label: Center(
                            child: Text(
                              "Description",
                              style: TextStyle(color: emerald300),
                            ),
                          ),
                          size: ColumnSize.L,
                        ),
                        DataColumn(
                          label: Center(
                              child: Text(
                            'Share',
                            style: TextStyle(color: emerald300),
                          )),
                        ),
                      ],
                      rows: List<DataRow>.generate(
                        controller.incentiveShareModel!.data.length,
                        (index) => DataRow(cells: [
                          DataCell(Center(
                              child: CustomText(
                            text: controller
                                .incentiveShareModel!.data[index].name!,
                          ))),
                          DataCell(Center(
                              child: CustomText(
                                  text: controller.incentiveShareModel!
                                      .data[index].amountOfShare
                                      .toString()))),
                        ]),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
