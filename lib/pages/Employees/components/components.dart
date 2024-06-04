import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/components.dart';
import 'package:flutter_web_dashboard/constants/style.dart';

Widget Actionsbar(TextEditingController controller, BuildContext context) {
  TextEditingController fnamecontroller = new TextEditingController();
  TextEditingController lnamecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController rolecontroller = new TextEditingController();
  TextEditingController gradecontroller = new TextEditingController(text: 'A');
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Row(
      children: [
        //myTextField(controller, context, 'Search', Icon(Icons.search_outlined)),
        IconButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  var screenSize = MediaQuery.of(context).size;
                  return Dialog(
                    child: Container(
                      width: screenSize.width * 0.3, // 80% of screen width
                      height: screenSize.height * 0.6, // 50% of screen height
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              'Add New Employee',
                              style: TextStyle(fontSize: 25),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              child: TextField(
                                controller: fnamecontroller,
                                decoration: InputDecoration(
                                  label: Text(
                                    'First Name',
                                  ),
                                ),
                              ),
                              width: screenSize.width * .2,
                            ),
                            SizedBox(
                              child: TextField(
                                controller: lnamecontroller,
                                decoration: InputDecoration(
                                  label: Text(
                                    'Last Name',
                                  ),
                                ),
                              ),
                              width: screenSize.width * .2,
                            ),
                            SizedBox(
                              child: TextField(
                                controller: emailcontroller,
                                decoration: InputDecoration(
                                  label: Text(
                                    'Email Address',
                                  ),
                                ),
                              ),
                              width: screenSize.width * .2,
                            ),
                            SizedBox(
                              child: TextField(
                                controller: rolecontroller,
                                decoration: InputDecoration(
                                  label: Text(
                                    'Employee Role',
                                  ),
                                ),
                              ),
                              width: screenSize.width * .2,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            DropdownMenu(
                              dropdownMenuEntries: [
                                DropdownMenuEntry(value: 'A', label: 'A'),
                                DropdownMenuEntry(value: 'B', label: 'B'),
                                DropdownMenuEntry(value: 'C', label: 'C'),
                                DropdownMenuEntry(value: 'D', label: 'D'),
                              ],
                              controller: gradecontroller,
                              label: Text('Grade'),
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
                                  style: TextStyle(color: emerald400),
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                });
          },
          icon: Icon(Icons.add_box_outlined, color: active),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.search_outlined, color: active),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.filter_alt_outlined, color: active),
        ),
      ],
    ),
  );
}
