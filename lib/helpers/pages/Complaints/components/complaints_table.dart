import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/components.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';

/// Example without datasource
class ComplaintsTable extends StatelessWidget {
  ComplaintsTable({super.key});

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
                      "Employee Name",
                      style: TextStyle(color: emerald300),
                    ),
                  ),
                  size: ColumnSize.L,
                ),
                DataColumn(
                  label: Center(
                      child: Text(
                    'Date',
                    style: TextStyle(color: emerald300),
                  )),
                ),
                DataColumn(
                  label: Center(child: Text('')),
                ),
              ],
              rows: List<DataRow>.generate(
                50,
                (index) => DataRow(
                  cells: [
                    const DataCell(
                        Center(child: CustomText(text: "Akai Uraraka"))),
                    const DataCell(Center(child: CustomText(text: "5/6/2024"))),
                    // DataCell(Center(
                    //   child: Icon(
                    //     Icons.arrow_circle_right_rounded,
                    //     color: active,
                    //   ),
                    // )),
                    DataCell(Center(
                      child: IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              var screenSize = MediaQuery.of(context).size;
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
                                              style:
                                                  TextStyle(color: emerald300),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(Icons.arrow_circle_right_rounded,
                            color: active),
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
