import 'package:buildcondition/buildcondition.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/controllers/reports_controller.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/get.dart';

/// Example without datasource
class ReportsTable extends StatelessWidget {
  //const
  ReportsTable({super.key});

  ReportsController controller = Get.put(ReportsController());

  List<String> stuff = ['Finance', 'HR'];

  TextEditingController gradecontroller = new TextEditingController();
  TextEditingController descriptioncontroller = new TextEditingController();
  TextEditingController basesalaryontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    controller.get_reports_f();
    controller.get_reports_hr();
    return GetBuilder(
      init: controller,
      builder: (controller) => BuildCondition(
        condition: controller.reportsFModel != null &&
            controller.reportsHRModel != null,
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
                                                    Text(controller
                                                        .reportsFModel!
                                                        .average_salary
                                                        .toString())
                                                  ],
                                                ),
                                                width: screenSize.width * .5,
                                              ),
                                              SizedBox(
                                                child: Row(
                                                  children: [
                                                    Text('Average Incentives'),
                                                    Text(controller
                                                        .reportsFModel!
                                                        .average_incentives!)
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
                                                'HR Report',
                                                style: TextStyle(fontSize: 25),
                                              ),
                                              SizedBox(
                                                child: Row(
                                                  children: [
                                                    Text(
                                                        'Top 3 Employees of the Month'),
                                                    Column(
                                                      children: [
                                                        Text(controller
                                                                .reportsHRModel!
                                                                .topThreeEmployeeOfTheMonth[
                                                                    0]
                                                                .employeeName +
                                                            '  ' +
                                                            controller
                                                                .reportsHRModel!
                                                                .topThreeEmployeeOfTheMonth[
                                                                    0]
                                                                .employeeOfTheMonth
                                                                .toString()),
                                                        Text(controller
                                                                .reportsHRModel!
                                                                .topThreeEmployeeOfTheMonth[
                                                                    1]
                                                                .employeeName +
                                                            '  ' +
                                                            controller
                                                                .reportsHRModel!
                                                                .topThreeEmployeeOfTheMonth[
                                                                    1]
                                                                .employeeOfTheMonth
                                                                .toString()),
                                                        Text(controller
                                                                .reportsHRModel!
                                                                .topThreeEmployeeOfTheMonth[
                                                                    2]
                                                                .employeeName +
                                                            '  ' +
                                                            controller
                                                                .reportsHRModel!
                                                                .topThreeEmployeeOfTheMonth[
                                                                    2]
                                                                .employeeOfTheMonth
                                                                .toString()),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                width: screenSize.width * .5,
                                              ),
                                              SizedBox(
                                                child: Row(
                                                  children: [
                                                    Text(
                                                        'Max Employee Salary: '),
                                                    Text(controller
                                                            .reportsHRModel!
                                                            .maxEmployeeSalary[
                                                                0]
                                                            .employeeName +
                                                        '   ' +
                                                        controller
                                                            .reportsHRModel!
                                                            .maxEmployeeSalary[
                                                                0]
                                                            .maxSalary
                                                            .toString())
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
                              }
                            },
                            child: Text('View 🙈'),
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
