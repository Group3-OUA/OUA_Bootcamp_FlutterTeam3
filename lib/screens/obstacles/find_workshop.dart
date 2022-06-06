import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:bootcamp_project/widgets/build_AppBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FindWorkshop extends StatefulWidget {
  const FindWorkshop({Key? key}) : super(key: key);

  @override
  State<FindWorkshop> createState() => _FindWorkshopState();
}

class _FindWorkshopState extends State<FindWorkshop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        "Mentor Bul",
        Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.arrow_back_ios_sharp),
              onPressed: () {
                Navigator.pop(context);
                // print("open drawer");
              },
            );
          },
        ),
        Colors.transparent,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
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
              SizedBox(height: 200),
              Text(
                "ÇOK YAKINDA! ",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: ColorConstants.darkblue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
