import 'package:buildcondition/buildcondition.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/controllers/incentive_share_controller.dart';
import 'package:flutter_web_dashboard/controllers/reports_f_controller.dart';
import 'package:flutter_web_dashboard/controllers/salary_grades_controller.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

/// Example without datasource
class ReportsTable extends StatelessWidget {
  //const
  ReportsTable({super.key});

  ReportsFController controller = Get.put(ReportsFController());

  List<String> stuff = ['Finance', 'HR'];

  TextEditingController gradecontroller = new TextEditingController();
  TextEditingController descriptioncontroller = new TextEditingController();
  TextEditingController basesalaryontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    controller.get_reports_f();
    return GetBuilder(
      init: controller,
      builder: (controller) => BuildCondition(
        condition: controller.reportsFModel != null,
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
                              "",
                              style: TextStyle(color: emerald300),
                            ),
                          ),
                          size: ColumnSize.L,
                        ),
                        DataColumn(
                          label: Center(
                              child: Text(
                            '',
                            style: TextStyle(color: emerald300),
                          )),
                        ),
                      ],
                      rows: List<DataRow>.generate(
                        2,
                        (index) => DataRow(cells: [
                          DataCell(Center(
                              child: CustomText(
                            text: stuff[index],
                          ))),
                          DataCell(Center(
                              child: TextButton(
                            onPressed: () {
                              if (index == 0) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    var screenSize =
                                        MediaQuery.of(context).size;
                                    return Dialog(
                                      child: Container(
                                        width: screenSize.width *
                                            0.6, // 80% of screen width
                                        height: screenSize.height *
                                            0.6, // 50% of screen height
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Finance Report',
                                                style: TextStyle(fontSize: 25),
                                              ),
                                              SizedBox(
                                                child: Row(
                                                  children: [
                                                    Text('Average Salary'),
                                                    Text(
                                                        'controller.reportsFModel.')
                                                  ],
                                                ),
                                                width: screenSize.width * .5,
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'OK',
                                                    style: TextStyle(
                                                        color: emerald300),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    var screenSize =
                                        MediaQuery.of(context).size;
                                    return Dialog(
                                      child: Container(
                                        width: screenSize.width *
                                            0.6, // 80% of screen width
                                        height: screenSize.height *
                                            0.6, // 50% of screen height
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Complaint Details',
                                                style: TextStyle(fontSize: 25),
                                              ),
                                              SizedBox(
                                                child: Text(
                                                    'lorem ipsum dolor sit amet, consectetur lorem   lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum dolor sit amet lorem ipsum d Lorem ipsum d Lorem ipsum d Lorem ips    lorem ipsum d Lorem ipsum d Lorem lorem ipsum d Lorem ipsum d Lorem ips lorem ipsum d Lorem ipsum d Lorem ips'),
                                                // child: TextField(
                                                //   controller:
                                                //       emp_fname_controller,
                                                //   decoration: InputDecoration(
                                                //     label: Text(
                                                //       'First Name',
                                                //     ),
                                                //   ),
                                                // ),
                                                width: screenSize.width * .5,
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    'OK',
                                                    style: TextStyle(
                                                        color: emerald300),
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }
                            },
                            child: Text('🙈'),
                          ))),
                        ]),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
