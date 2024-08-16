import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/controllers/employees_controller.dart';

Widget Actionsbar(EmployeesController controller, BuildContext context) {
  TextEditingController fnamecontroller = new TextEditingController();
  TextEditingController lnamecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController rolecontroller = new TextEditingController();
  TextEditingController gradecontroller = new TextEditingController();
  var screenSize = MediaQuery.of(context).size;

  return Padding(
    padding: const EdgeInsets.only(bottom: 1.0),
    child: Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
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
                                  DropdownMenuEntry(value: 1, label: 'A'),
                                  DropdownMenuEntry(value: 2, label: 'B'),
                                  DropdownMenuEntry(value: 3, label: 'C'),
                                  DropdownMenuEntry(value: 4, label: 'D'),
                                ],
                                controller: gradecontroller,
                                label: Text('Grade'),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextButton(
                                  onPressed: () {
                                    controller.create_employee(
                                        fnamecontroller.text,
                                        lnamecontroller.text,
                                        emailcontroller.text,
                                        '254624521',
                                        20,
                                        5,
                                        7,
                                        656565,
                                        int.parse(gradecontroller.text),
                                        'A',
                                        'Employee',
                                        656565.5);
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
            icon: Icon(Icons.filter_alt_outlined, color: active),
          ),

          Container(
            width: screenSize.width * .2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              //EdgeInsets.only(
              // left: screenSize.width * .3, right: screenSize.width * .3),
              child: TextField(
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

myCard(context, model, index) {
  return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
          onTap: () {},
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    model.data!.products[index].name!,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (model.data!.products[index].discount != 0)
                        Text(
                          model.data!.products[index].old_price.toString() +
                              '\$',
                          style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: Colors.redAccent),
                        ),
                      Text(
                        model.data!.products[index].price.toString() + '\$',
                        style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                )
              ])));
}
