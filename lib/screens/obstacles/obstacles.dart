import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:bootcamp_project/widgets/build_AppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ObstaclesScreen extends StatelessWidget {
  const ObstaclesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Bu yolda engelleri birlikte aşalım",
                                style: GoogleFonts.poppins(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: ColorConstants.black,
                                ),
                              ),
                              Text(
                                "Birlikte Yapacağımız Müzik Atolyeleri ile  ",
                                style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: ColorConstants.mainblue,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: ColorConstants.secondaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Center(child: Text("data")),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: ColorConstants.secondaryColor,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Center(child: Text("data")),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
