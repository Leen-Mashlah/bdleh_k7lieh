import 'dart:io';

import 'package:buildcondition/buildcondition.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/components.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/controllers/employees_controller.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/get.dart';

/// Example without datasource
// ignore: must_be_immutable
class EmployeesTable extends StatelessWidget {
  late EmployeesController controller;
  EmployeesTable(EmployeesController controller, {super.key}) {
    this.controller = controller;
  }
  TextEditingController emp_fname_controller = new TextEditingController();
  TextEditingController emp_lname_controller = new TextEditingController();
  TextEditingController emp_role_controller = new TextEditingController();
  TextEditingController emp_email_controller = new TextEditingController();
  //TextEditingController emp_grade_controller = new TextEditingController(text: 'A');

  @override
  Widget build(BuildContext context) {
    controller.getemp();
    print('sent request');
    return GetBuilder(
      init: controller,
      builder: (controller) => BuildCondition(
        condition: controller.employeesModel != null,
        fallback: (context) => Center(
          child: CircularProgressIndicator(),
        ),
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
                height: (56 * 50) + 40,
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
                          "Grade",
                          style: TextStyle(color: emerald300),
                        ),
                      ),
                      size: ColumnSize.L,
                    ),
                    DataColumn(
                      label: Center(
                          child: Text(
                        'Employee Name',
                        style: TextStyle(color: emerald300),
                      )),
                    ),
                    DataColumn(
                      label: Center(
                          child: Text(
                        'Role',
                        style: TextStyle(color: emerald300),
                      )),
                    ),
                    DataColumn(
                      label: Center(
                          child: Text(
                        'Salary',
                        style: TextStyle(color: emerald300),
                      )),
                    ),
                    DataColumn(
                      label: Center(
                          child: Text(
                        '⭐',
                        style: TextStyle(color: emerald300),
                      )),
                    ),
                    DataColumn(
                      label: Center(child: Text('')),
                    ),
                  ],
                  rows: List<DataRow>.generate(
                    controller.employeesModel!.data.length,
                    (index) => DataRow(
                      cells: [
                        DataCell(Center(
                            child: CustomText(
                          text: controller.employeesModel!.data[index].letter!,
                        ))),
                        DataCell(Center(
                            child: CustomText(
                                text: controller.employeesModel!.data[index]
                                        .firstName! +
                                    ' ' +
                                    controller.employeesModel!.data[index]
                                        .lastName!))),
                        DataCell(Center(
                            child: CustomText(
                                text: controller.employeesModel!.data[index]
                                    .description!))),
                        DataCell(Center(
                            child: CustomText(
                                text: controller
                                    .employeesModel!.data[index].salary
                                    .toString()))),
                        DataCell(Center(
                          child: Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                        )),
                        DataCell(Center(
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      var screenSize =
                                          MediaQuery.of(context).size;
                                      return Dialog(
                                        child: Container(
                                          width: screenSize.width *
                                              0.3, // 80% of screen width
                                          height: screenSize.height *
                                              0.55, // 50% of screen height
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Edit Employee',
                                                  style:
                                                      TextStyle(fontSize: 25),
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                SizedBox(
                                                  child: TextField(
                                                    controller:
                                                        emp_fname_controller,
                                                    decoration: InputDecoration(
                                                      label: Text(
                                                        'First Name',
                                                      ),
                                                    ),
                                                  ),
                                                  width: screenSize.width * .2,
                                                ),
                                                SizedBox(
                                                  child: TextField(
                                                    controller:
                                                        emp_lname_controller,
                                                    decoration: InputDecoration(
                                                      label: Text(
                                                        'Last Name',
                                                      ),
                                                    ),
                                                  ),
                                                  width: screenSize.width * .2,
                                                ),
                                                SizedBox(
                                                  child: TextField(
                                                    controller:
                                                        emp_email_controller,
                                                    decoration: InputDecoration(
                                                      label: Text(
                                                        'Email Address',
                                                      ),
                                                    ),
                                                  ),
                                                  width: screenSize.width * .2,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                TextButton(
                                                    onPressed: () {
                                                      controller.update_employee(
                                                          controller
                                                              .employeesModel!
                                                              .data[index]
                                                              .id!,
                                                          emp_fname_controller
                                                              .text,
                                                          emp_lname_controller
                                                              .text,
                                                          emp_email_controller
                                                              .text);
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      'Confirm',
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
                                },
                                icon: Icon(Icons.edit_outlined, color: active),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      var screenSize =
                                          MediaQuery.of(context).size;
                                      return Dialog(
                                        child: Container(
                                          width: screenSize.width *
                                              0.25, // 80% of screen width
                                          height: screenSize.height *
                                              0.12, // 50% of screen height
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              children: [
                                                Text(
                                                  'Are you sure you want to delete this employee?',
                                                  style:
                                                      TextStyle(fontSize: 15),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                TextButton(
                                                    onPressed: () {
                                                      controller.del_emp(
                                                        controller
                                                            .employeesModel!
                                                            .data[index]
                                                            .id!,
                                                      );
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text('Confirm'))
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                icon: Icon(Icons.delete_outlined,
                                    color: Colors.redAccent),
                              ),
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
