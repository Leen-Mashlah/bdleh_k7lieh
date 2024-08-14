import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/components.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/helpers/pages/Grades/components/grades_table.dart';

// ignore: must_be_immutable
class GradesPage extends StatelessWidget {
  GradesPage({super.key});
  TextEditingController searchController = TextEditingController();
  TextEditingController gradenameController = TextEditingController();
  TextEditingController basesalaryController = TextEditingController();
  ScrollController sc = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            //Obx(
            // () =>
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                    // child: CustomText(
                    //   text: menuController.activeItem.value,
                    //   size: 24,
                    //   weight: FontWeight.bold,
                    // )),
                    child: Text(
                      'Grades',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ))
              ],
            ),

            Expanded(
              child: ListView(
                controller: sc,
                children: [
                  GradesTable(),
                ],
              ),
            ),
          ],
        ),
        Positioned.directional(
          textDirection: TextDirection.ltr,
          bottom: 20,
          end: 20,
          child: MyFloatButton(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      var screenSize = MediaQuery.of(context).size;
                      return Dialog(
                        child: Container(
                          width: screenSize.width * 0.3, // 80% of screen width
                          height:
                              screenSize.height * 0.37, // 50% of screen height
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  'Add Grade',
                                  style: TextStyle(fontSize: 25),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  child: TextField(
                                    controller: gradenameController,
                                    decoration: InputDecoration(
                                      label: Text(
                                        'Name of grade :',
                                      ),
                                    ),
                                  ),
                                  width: screenSize.width * .2,
                                ),
                                SizedBox(
                                  child: TextField(
                                    controller: basesalaryController,
                                    decoration: InputDecoration(
                                      label: Text(
                                        'Base salary :',
                                      ),
                                    ),
                                  ),
                                  width: screenSize.width * .2,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Confirm',
                                      style: TextStyle(color: emerald300),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              icon: Icons.add),
        ),
      ],
    );
  }
}
