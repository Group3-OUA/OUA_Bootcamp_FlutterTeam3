import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url = "assets/images/intro2.png";
    return Scaffold(
      backgroundColor: ColorConstants.white,
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Senfonia",
                style: GoogleFonts.poppins(
                    fontSize: 25,
                    color: ColorConstants.mainblue,
                    fontWeight: FontWeight.w600)),
          ),
          Container(
            height: 380,
            child: Image.asset(
              url,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: Container(
                child: Column(
                  children: [
                    Text(
                      "Tecrübeli İnsanlardan Tavsiye Al",
                      style: GoogleFonts.poppins(
                          fontSize: 21,
                          color: ColorConstants.black,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Tecrübeli insanların yazdığı blogları okuyarak merak ettiklerini kolayca öğrenebilirsin",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
