import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String url = "assets/images/intro1.png";
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Text("Senfonia",
              style: GoogleFonts.poppins(
                  fontSize: 25,
                  color: ColorConstants.mainblue,
                  fontWeight: FontWeight.w600)),
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
                      "Müzik ile İlgili Tüm İlanlar",
                      style: GoogleFonts.poppins(
                          fontSize: 21,
                          color: ColorConstants.black,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Senfonia'da müzik ile ilgili tüm ilanlara ulaşabilirsin. Örneğin ekibine müziysyen çocuğuna özel hoca bulabilirsin",
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
      )),
    );
  }
}
