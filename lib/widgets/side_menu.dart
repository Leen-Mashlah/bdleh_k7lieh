import 'package:flutter/material.dart';
import 'package:flutter_web_dashboard/constants/controllers.dart';
import 'package:flutter_web_dashboard/constants/style.dart';
import 'package:flutter_web_dashboard/helpers/reponsiveness.dart';
import 'package:flutter_web_dashboard/routing/routes.dart';
import 'package:flutter_web_dashboard/widgets/custom_text.dart';
import 'package:flutter_web_dashboard/widgets/side_menu_item.dart';
import 'package:get/get.dart';

import '../controllers/admin_login_controller.dart';

class SideMenu extends StatelessWidget {
 
  AdminLoginController rolescontroller=Get.put(AdminLoginController());
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    List<MenuItem> rolesItem;

    if(rolescontroller.roles=='HR')
    {
      rolesItem=hrSideMenuItemRoutes;
    }
    
    else if(rolescontroller.roles=='FM')
    {
        rolesItem=fmSideMenuItemRoutes;
    }

    else 
    {
      rolesItem=sideMenuItemRoutes;
    }
    

    

    return Container(
      color: dark,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(width: width / 48),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset("assets/icons/logo.png"),
                    ),
                    const Flexible(
                      child: CustomText(
                        text: "Dash",
                        size: 20,
                        weight: FontWeight.bold,
                        color: active,
                      ),
                    ),
                    SizedBox(width: width / 48),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          Divider(
            color: lightGrey.withOpacity(.1),
          ),
          SizedBox(
            height: 70,
            child: CircleAvatar(
              radius: 20,
              backgroundImage: Image.network(
                'assets/images/profile.jpg',
                height: 70,
                width: 70,
              ).image,
              foregroundImage: Image.network(
                'https://cdn1.iconfinder.com/data/icons/bokbokstars-121-classic-stock-icons-1/512/person-man.png',
              ).image,
              onBackgroundImageError: (exception, stackTrace) => Image.asset(
                'assets/images/profile.jpg',
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            //userData.name!,
            'Manager', textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: lightGrey.withOpacity(.1),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: rolesItem
                .map((item) => SideMenuItem(
                    itemName: item.name,
                    onTap: () {
                      if (item.route == authenticationPageRoute) {
                        Get.offAllNamed(authenticationPageRoute);
                        menuController
                            .changeActiveItemTo(overviewPageDisplayName);
                      }
                      if (!menuController.isActive(item.name)) {
                        menuController.changeActiveItemTo(item.name);
                        if (ResponsiveWidget.isSmallScreen(context)) {
                          Get.back();
                        }
                        navigationController.navigateTo(item.route);
                      }
                    }))
                .toList(),
          )
        ],
      ),
    );
  }
}
