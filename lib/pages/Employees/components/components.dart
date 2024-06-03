import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/components.dart';
import 'package:flutter_web_dashboard/constants/style.dart';

Widget Actionsbar(TextEditingController controller, BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width,
    child: Row(
      children: [
        //myTextField(controller, context, 'Search', Icon(Icons.search_outlined)),
        IconButton(
          onPressed: () {},
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
