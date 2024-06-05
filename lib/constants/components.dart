import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';

BorderRadius StandardBorderRadius = BorderRadius.circular(30.0);
BorderRadius ActiveBorderRadius = BorderRadius.circular(10.0);

Widget myTextField(TextEditingController controller, BuildContext context,
    String label, Icon prefixIcon,
    {int height = 1,
    int maxLines = 1,
    Widget? postfixicon,
    bool obscureText = false,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    bool autofocus = false}) {
  return TextFormField(
    autofocus: autofocus,
    minLines: height,
    maxLines: maxLines,
    controller: controller,
    validator: validator,
    keyboardType: keyboardType,
    obscureText: obscureText,
    decoration: InputDecoration(
      label: Text(label),
      prefixIcon: prefixIcon,
      suffixIcon: postfixicon,
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 2.0),
          borderRadius: StandardBorderRadius),
      focusedBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: Theme.of(context).primaryColor, width: 3.0),
        borderRadius: ActiveBorderRadius,
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.redAccent, width: 2.0),
        borderRadius: ActiveBorderRadius,
      ),
    ),
  );
}

Widget MyFloatButton({VoidCallback? onTap, IconData? icon}) {
  return Container(
    child: InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 52.0,
        height: 52.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: dark,
        ),
        child: Icon(
          icon,
          color: Colors.white,
          size: 25.0,
        ),
      ),
    ),
  );
}

class statefull extends StatefulWidget {
  const statefull({super.key});

  @override
  State<statefull> createState() => check();
}

class check extends State<statefull> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            activeColor: dark,
            value: checked,
            onChanged: (value) {
              setState(() {
                checked = value!;
              });
            }),
        //Text(text.tr, style: TextStyle(color: Theme.of(context).primaryColor)),
      ],
    );
  }
}
