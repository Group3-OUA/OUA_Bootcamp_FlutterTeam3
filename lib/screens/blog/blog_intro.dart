import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:bootcamp_project/screens/blog/add_blog.dart';
import 'package:bootcamp_project/widgets/build_AppBar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogIntro extends StatelessWidget {
  const BlogIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
        // appBar: buildAppBar(
        //   context,
        //   "Bloglar",
        //   Builder(
        //     builder: (context) {
        //       return IconButton(
        //         icon: SvgPicture.asset("assets/icons/Drawer.svg"),
        //         onPressed: () {
        //           // print("open drawer");
        //         },
        //       );
        //     },
        //   ),
        //   Colors.transparent,
        // ),
        body: Stack(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                child: Center(
                  child: Text(
                    "data",
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: ColorConstants.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
                  color: ColorConstants.secondaryColor,
                ),
                // color: ColorConstants.categorypurple,
              ),
            ),
          ],
        ),
        floatingActionButton: Visibility(
          visible: !keyboardIsOpen,
          child: Padding(
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
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: buildBottomNavBar());
  }
}
