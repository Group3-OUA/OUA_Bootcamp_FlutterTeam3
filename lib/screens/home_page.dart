import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:bootcamp_project/screens/register_page.dart';
import 'package:bootcamp_project/services/auth_service.dart';
import 'package:bootcamp_project/widgets/build_AppBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart ';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
        appBar: buildAppBar(
          context,
          "Explore",
          IconButton(
            icon: SvgPicture.asset("assets/icons/Drawer.svg"),
            onPressed: () {
              // handle the press
            },
          ),
          Colors.transparent,
        ),
        body: Column(children: [
          // TextField(
          //   decoration: InputDecoration(
          //       labelText: 'Search',
          //       border: OutlineInputBorder(),
          //       prefixIcon: Icon(Icons.search),),
          // ),
          Center(
            child: Text(user != null ? 'Welcome ${user.email}' : ''),
          )
        ]),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.add,
              color: ColorConstants.darkblue,
              size: 30,
            ),
            onPressed: () {},
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: ColorConstants.secondaryColor,
          shape: CircularNotchedRectangle(),
          notchMargin: 4,
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: SvgPicture.asset("assets/icons/home.svg"),
                      onPressed: () {
                        // handle the press
                      },
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Row(children: [
                        Icon(
                          Icons.search,
                          color: ColorConstants.darkblue,
                        ),
                      ]),
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
