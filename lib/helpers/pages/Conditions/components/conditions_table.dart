import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';

/// Example without datasource
class ConditionsTable extends StatelessWidget {
  ConditionsTable({super.key});
  TextEditingController emp_fname_controller =
      new TextEditingController(text: 'Akai');
  TextEditingController emp_lname_controller =
      new TextEditingController(text: 'Uraraka');
  TextEditingController emp_role_controller =
      new TextEditingController(text: 'HR');
  TextEditingController emp_email_controller =
      new TextEditingController(text: 'umr@gmail.com');

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      "#",
                      style: TextStyle(color: emerald300),
                    ),
                  ),
                  size: ColumnSize.S,
                ),
                DataColumn2(
                  size: ColumnSize.L,
                  label: Center(
                      child: Text(
                    'Condition',
                    style: TextStyle(color: emerald300),
                  )),
                ),
                DataColumn2(
                  size: ColumnSize.S,
                  label: Center(
                      child: Text(
                    'Points',
                    style: TextStyle(color: emerald300),
                  )),
                ),
                DataColumn2(
                  size: ColumnSize.S,
                  label: Center(
                      child: Text(
                    '',
                    style: TextStyle(color: emerald300),
                  )),
                ),
              ],
              rows: List<DataRow>.generate(
                5,
                (index) => DataRow(
                  cells: [
                    const DataCell(Center(
                        child: CustomText(
                      text: "0",
                    ))),
                    const DataCell(Center(
                        child: CustomText(
                            text:
                                "Safety off, magazine in the gun, bullet in the chamber "))),
                    DataCell(Center(child: CustomText(text: "30"))),
                    DataCell(Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  var screenSize = MediaQuery.of(context).size;
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
                                              'Edit Condition',
                                              style: TextStyle(fontSize: 25),
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
                                                    'Condition',
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
                                                    'Points',
                                                  ),
                                                ),
                                              ),
                                              width: screenSize.width * .2,
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            TextButton(
                                                onPressed: () {
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
                                  var screenSize = MediaQuery.of(context).size;
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
                                              'Are you sure you want to delete this condition?',
                                              style: TextStyle(fontSize: 15),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            TextButton(
                                                onPressed: () {
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
    );
  }
}
