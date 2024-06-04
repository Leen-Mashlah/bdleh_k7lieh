import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';

/// Example without datasource
class GradesTable extends StatelessWidget {
  const GradesTable({super.key});

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
                5,
                (index) => DataRow(
                  cells: [
                    const DataCell(Center(child: CustomText(text: "Grade A"))),
                    const DataCell(Center(child: CustomText(text: "7.000\$"))),
                    DataCell(Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.edit_outlined, color: active),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          IconButton(
                            onPressed: () {},
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
