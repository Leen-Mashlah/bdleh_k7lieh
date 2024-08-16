import 'package:buildcondition/buildcondition.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/controllers/salary_grades_controller.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

/// Example without datasource
class GradesTable extends StatelessWidget {
  //const
  GradesTable({super.key});

  SalaryGradesController controller = Get.put(SalaryGradesController());

  TextEditingController gradecontroller = new TextEditingController();
  TextEditingController descriptioncontroller = new TextEditingController();
  TextEditingController basesalaryontroller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    controller.get_salary_grade();
    return GetBuilder(
      init: controller,
      builder: (controller) => BuildCondition(
        condition: controller.salarygradesModel != null,
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
                              "Grades",
                              style: TextStyle(color: emerald300),
                            ),
                          ),
                          size: ColumnSize.L,
                        ),
                        DataColumn(
                          label: Center(
                              child: Text(
                            'Base Salary',
                            style: TextStyle(color: emerald300),
                          )),
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
                        controller.salarygradesModel!.data.length,
                        (index) => DataRow(cells: [
                          DataCell(Center(
                              child: CustomText(
                            text: controller
                                .salarygradesModel!.data[index].letter!,
                          ))),
                          DataCell(Center(
                              child: CustomText(
                                  text: controller.salarygradesModel!
                                      .data[index].basicSalary
                                      .toString()))),
                          DataCell(
                            Center(
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                                    0.5, // 50% of screen height
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        'Edit Grade',
                                                        style: TextStyle(
                                                            fontSize: 25),
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      SizedBox(
                                                        child: TextField(
                                                          controller:
                                                              descriptioncontroller,
                                                          decoration:
                                                              InputDecoration(
                                                            label: Text(
                                                              'Description',
                                                            ),
                                                          ),
                                                        ),
                                                        width:
                                                            screenSize.width *
                                                                .2,
                                                      ),
                                                      SizedBox(
                                                        child: TextField(
                                                          controller:
                                                              basesalaryontroller,
                                                          decoration:
                                                              InputDecoration(
                                                            label: Text(
                                                              'Base Salary',
                                                            ),
                                                          ),
                                                        ),
                                                        width:
                                                            screenSize.width *
                                                                .2,
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      DropdownMenu(
                                                        dropdownMenuEntries: [
                                                          DropdownMenuEntry(
                                                              value: 'A',
                                                              label: 'A'),
                                                          DropdownMenuEntry(
                                                              value: 'B',
                                                              label: 'B'),
                                                          DropdownMenuEntry(
                                                              value: 'C',
                                                              label: 'C'),
                                                          DropdownMenuEntry(
                                                              value: 'D',
                                                              label: 'D'),
                                                        ],
                                                        controller:
                                                            gradecontroller,
                                                        label: Text('Grade'),
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      TextButton(
                                                          onPressed: () {
                                                            print('sending');
                                                            controller.update_salary_grade(
                                                                controller
                                                                    .salarygradesModel!
                                                                    .data[index]
                                                                    .id!,
                                                                gradecontroller
                                                                    .text,
                                                                descriptioncontroller
                                                                    .text,
                                                                double.parse(
                                                                    basesalaryontroller
                                                                        .text));
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            'Confirm',
                                                            style: TextStyle(
                                                                color:
                                                                    emerald300),
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(Icons.edit_outlined,
                                          color: active),
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
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        'Are you sure you want to delete this grade?',
                                                        style: TextStyle(
                                                            fontSize: 15),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      TextButton(
                                                          onPressed: () {
                                                            controller
                                                                .del_salary_grade(
                                                              controller
                                                                  .salarygradesModel!
                                                                  .data[index]
                                                                  .id!,
                                                            );
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            'Confirm',
                                                            style: TextStyle(
                                                                color:
                                                                    emerald300),
                                                          ))
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
                                  ]),
                            ),
                          ),
                        ]),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
