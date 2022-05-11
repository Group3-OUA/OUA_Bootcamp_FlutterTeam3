import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:bootcamp_project/constants/padding_constant.dart';
import 'package:bootcamp_project/screens/login_page.dart';
import 'package:bootcamp_project/screens/register_page.dart';
import 'package:bootcamp_project/widgets/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text("Senfonia",
              style: GoogleFonts.poppins(
                  fontSize: 30, color: ColorConstants.mainblue)),
          Container(
            height: 250,
            child: SvgPicture.asset("assets/images/onboard.svg"),
          ),
          Padding(
            padding: PaddingConstant.padding20,
            child: Column(
              children: [
                Text(
                  "Müziğini insanlarla paylaşarak hayatın tadını çıkar",
                  style: GoogleFonts.poppins(
                      fontSize: 21, color: ColorConstants.black),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Sana müziksevelerle sosyalleşme ortamı sunarken deneyimlerini aktarabileceğin bir platform sağlıyoruz",
                  style: GoogleFonts.poppins(
                      fontSize: 16, color: ColorConstants.textgrey),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: ElevatedButton(
                      child: Text(
                        "Log In",
                        style: GoogleFonts.poppins(
                            fontSize: 16, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          primary: ColorConstants.mainblue),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }));
                      }),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: ElevatedButton(
                      child: Text(
                        "Register",
                        style: GoogleFonts.poppins(
                            fontSize: 16, color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          primary: ColorConstants.mainblue),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return RegisterPage();
                        }));
                      }),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginPage();
                      }));
                    },
                    child: Text(
                      'Üye olmadan devam et!',
                      style: GoogleFonts.poppins(
                          fontSize: 16, color: ColorConstants.secondaryColor),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
