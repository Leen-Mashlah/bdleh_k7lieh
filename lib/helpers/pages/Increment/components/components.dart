import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/components.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:get/get.dart';

Widget Actionsbar(TextEditingController controller, BuildContext context) {
  var screenSize = MediaQuery.of(context).size;

  return Container(
    width: screenSize.width * .1,
    child: Padding(
      padding: EdgeInsets.only(
          left: screenSize.width * .3, right: screenSize.width * .3),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          icon: Icon(Icons.percent),
          label: Text('Increment Percentage'),
        ),
      ),
    ),
  );
}

class statefull extends StatefulWidget {
  bool checked = false;
  statefull(bool value, {super.key}) {
    checked = value;
  }

  @override
  State<statefull> createState() => check(checked);
}

class check extends State<statefull> {
  check(bool checked) {
    this.checked = checked;
  }
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        activeColor: emerald400,
        value: checked,
        onChanged: (value) {
          setState(() {
            checked = value!;
          });
        });
  }
}

Widget checkBox(BuildContext context, {var checked, required String text}) =>
    Row(
      children: [
        Checkbox(
            activeColor: Colors.deepPurple,
            value: checked,
            onChanged: (value) {
              //setState(() {});
            }),
        Text(text.tr, style: TextStyle(color: Theme.of(context).primaryColor)),
      ],
    );
