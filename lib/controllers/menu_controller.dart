import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find();
  var activeItem = employeesPageDisplayName.obs;

  var hoverItem = "".obs;

  changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  isHovering(String itemName) => hoverItem.value == itemName;

  isActive(String itemName) => activeItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case employeesPageDisplayName:
        return _customIcon(CupertinoIcons.group_solid, itemName);
      case incrementPageDisplayName:
        return _customIcon(Icons.add_card_rounded, itemName);
      case gradesPageDisplayName:
        return _customIcon(Icons.stacked_bar_chart, itemName);
      case complaintsPageDisplayName:
        return _customIcon(CupertinoIcons.exclamationmark_bubble, itemName);
      case incentivePageDisplayName:
        return _customIcon(CupertinoIcons.gift, itemName);
      case incentiveShareDisplayName:
        return _customIcon(CupertinoIcons.chart_pie_fill, itemName);
      case conditionsPageDisplayName:
        return _customIcon(Icons.format_list_numbered_rounded, itemName);
      case reportsPageDisplayName:
        return _customIcon(Icons.data_thresholding_outlined, itemName);
      case filesPageDisplayName:
        return _customIcon(Icons.file_copy_rounded, itemName);
      case aboutPageDisplayName:
        return _customIcon(Icons.info_outline_rounded, itemName);
      case overviewPageDisplayName:
        return _customIcon(Icons.trending_up, itemName);
      case driversPageDisplayName:
        return _customIcon(Icons.drive_eta, itemName);
      case clientsPageDisplayName:
        return _customIcon(Icons.people_alt_outlined, itemName);
      case authenticationPageDisplayName:
        return _customIcon(Icons.exit_to_app, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(icon, size: 22, color: light);

    return Icon(
      icon,
      color: isHovering(itemName) ? light : lightGrey,
    );
  }
}
