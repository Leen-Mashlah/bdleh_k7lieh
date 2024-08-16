import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';

Widget Actionsbar(TextEditingController controller, BuildContext context) {
  TextEditingController fnamecontroller = new TextEditingController();
  TextEditingController lnamecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController rolecontroller = new TextEditingController();
  TextEditingController gradecontroller = new TextEditingController(text: 'A');
  var screenSize = MediaQuery.of(context).size;

  return Padding(
    padding: const EdgeInsets.only(bottom: 1.0),
    child: Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.filter_alt_outlined, color: active),
          ),
          Container(
            width: screenSize.width * .2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              //EdgeInsets.only(
              // left: screenSize.width * .3, right: screenSize.width * .3),
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.search,
                    color: active,
                  ),
                  label: Text('Search..'),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
