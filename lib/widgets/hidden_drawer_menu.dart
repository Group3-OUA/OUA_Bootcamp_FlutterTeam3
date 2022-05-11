import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:bootcamp_project/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  List<ScreenHiddenDrawer> pages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: 'Home', baseStyle: TextStyle(), selectedStyle: TextStyle()),
        HomePage(),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawerMenu(
      backgroundColorMenu: ColorConstants.lightblue,
      screens: [],
    );
  }
}
