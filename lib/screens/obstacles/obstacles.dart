import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:bootcamp_project/screens/obstacles/find_mentor.dart';
import 'package:bootcamp_project/screens/obstacles/find_workshop.dart';
import 'package:bootcamp_project/widgets/build_AppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ObstaclesScreen extends StatelessWidget {
  const ObstaclesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
        appBar: buildAppBar(
          context,
          "Engelleri Aş",
          Builder(
            builder: (context) {
              return IconButton(
                icon: SvgPicture.asset("assets/icons/Drawer.svg"),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                  // print("open drawer");
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          Colors.transparent,
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Bu yolda engelleri birlikte aşalım",
                                textAlign: TextAlign.start,
                                style: GoogleFonts.poppins(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  color: ColorConstants.black,
                                ),
                              ),
                              Text(
                                "Birlikte Yapacağımız Müzik Atolyeleri ile\n Engelleri Birlikte Aşalım ",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: ColorConstants.mainblue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FindWorkshop()));
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: ColorConstants.categorypurple,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Center(
                                child: Text(
                              "Atolye Bul",
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: ColorConstants.white,
                              ),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => FindMentor()));
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: ColorConstants.secondaryColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Center(
                                child: Text(
                              "Mentorlerle Konuş",
                              style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                color: ColorConstants.white,
                              ),
                            )),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            )
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
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(
                //     builder: (context) => AddBlogPage(user!)));
              },
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: buildBottomNavBar());
  }
}
