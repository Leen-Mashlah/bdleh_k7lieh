import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/components.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';

/// Example without datasource
class IncentivesTable extends StatelessWidget {
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
                      "Grade",
                      style: TextStyle(color: emerald300),
                    ),
                  ),
                  size: ColumnSize.S,
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
                    'Incentives',
                    style: TextStyle(color: emerald300),
                  )),
                ),
                DataColumn(
                  label: Center(
                      child: Text(
                    'Edit Points',
                    style: TextStyle(color: emerald300),
                  )),
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
                    DataCell(Center(child: CustomText(text: "1.500\$"))),
                    DataCell(
                      Center(
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                var screenSize = MediaQuery.of(context).size;
                                return Dialog(
                                  child: Container(
                                    width: screenSize.width *
                                        0.5, // 80% of screen width
                                    height: screenSize.height *
                                        0.8, // 50% of screen height
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Text(
                                              'Edit Points',
                                              style: TextStyle(fontSize: 25),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            ListView.separated(
                                                physics:
                                                    BouncingScrollPhysics(),
                                                shrinkWrap: true,
                                                itemBuilder:
                                                    (BuildContext context,
                                                            int index) =>
                                                        listItemBuilder(
                                                            context, index),
                                                itemCount: 14,
                                                separatorBuilder: (BuildContext
                                                            context,
                                                        int index) =>
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 4),
                                                      child: Container(
                                                        height: .5,
                                                        color: Colors.grey[200],
                                                      ),
                                                    )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          icon: Icon(Icons.edit_outlined, color: active),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  listItemBuilder(BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 5,
        ),
        Text(
          'Condition 1: Medical break',
          style: TextStyle(fontSize: 16),
        ),
        NumInput(context),
        SizedBox(
          width: 5,
        ),
      ],
    );
  }
}
