import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_web_dashboard/constants/components.dart';

import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';

import 'package:flutter_web_dashboard/helpers/pages/Files/components/components.dart';

// ignore: must_be_immutable
class FilesPage extends StatelessWidget {
  FilesPage({super.key});
  TextEditingController searchController = TextEditingController();
  //Scroll sc = Get.put(Scroll());
  ScrollController sc = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                    child: Text(
                      'Files',
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
                  Actionsbar(searchController, context),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.count(
                        childAspectRatio: 2.7,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        crossAxisCount: 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        children: List.generate(
                            20, (index) => myCard(context, index))),
                  ),
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
                sc.animateTo(
                  0.0,
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOut,
                );
                ;
              },
              icon: Icons.arrow_upward),
        ),
      ],
    );
  }
}
