import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:bootcamp_project/widgets/build_AppBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        "Hakkımızda",
        Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Text(
              "Biz Kimiz?",
              style: GoogleFonts.poppins(
                  fontSize: 20, color: ColorConstants.darkblue),
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.?",
              style: GoogleFonts.poppins(
                  fontSize: 15, color: ColorConstants.black),
            ),
            SizedBox(height: 20),
            Text(
              "İletişim",
              style: GoogleFonts.poppins(
                  fontSize: 20, color: ColorConstants.darkblue),
            ),
            Text(
              "info@senfonia.com",
              style: GoogleFonts.poppins(
                  fontSize: 15, color: ColorConstants.black),
            ),
          ],
        ),
      ),
    );
  }
}
