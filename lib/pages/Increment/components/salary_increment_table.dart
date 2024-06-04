import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/pages/Increment/components/components.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';

/// Example without datasource
class IncrementTable extends StatelessWidget {
  IncrementTable({super.key});

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
          Row(),
          SizedBox(
            height: (56 * 50) + 40,
            child: DataTable2(
              columnSpacing: 12,
              dataRowHeight: 56,
              headingRowHeight: 40,
              horizontalMargin: 12,
              minWidth: 600,
              columns: const [
                DataColumn(
                  label: Center(
                    child: Text(
                      "Grade",
                      style: TextStyle(color: emerald300),
                    ),
                  ),
                  //size: ColumnSize.L,
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
                    'Current Salary',
                    style: TextStyle(color: emerald300),
                  )),
                ),
                DataColumn(
                  label: Center(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 100,
                        ),
                        statefull(),
                      ],
                    ),
                  ),
                ),
              ],
              rows: List<DataRow>.generate(
                50,
                (index) => DataRow(
                  cells: [
                    const DataCell(Center(
                        child: CustomText(
                      text: "A",
                    ))),
                    const DataCell(
                        Center(child: CustomText(text: "Akai Uraraka"))),
                    DataCell(Center(child: CustomText(text: "7.000\$"))),
                    DataCell(Center(
                        child: Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                          ),
                          statefull(),
                        ],
                      ),
                    ))),
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
