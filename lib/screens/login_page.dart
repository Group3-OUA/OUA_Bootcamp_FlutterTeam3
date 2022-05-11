import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:bootcamp_project/constants/padding_constant.dart';
import 'package:bootcamp_project/screens/forgot_password.dart';
import 'package:bootcamp_project/screens/home_page.dart';
import 'package:bootcamp_project/screens/register_page.dart';
import 'package:bootcamp_project/services/auth_service.dart';
import 'package:bootcamp_project/widgets/build_AppBar.dart';
import 'package:bootcamp_project/widgets/rounded_input_field.dart';
import 'package:bootcamp_project/widgets/text_field_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: buildAppBar(
      //   context,
      //   "Log In ",
      //   IconButton(
      //     icon: SvgPicture.asset("assets/icons/Drawer.svg"),
      //     onPressed: () {
      //       // handle the press
      //     },
      //   ),
      //   ColorConstants.mainblue,
      // ),
      body: Padding(
          padding: PaddingConstant.padding20,
          child: ListView(
            padding: EdgeInsets.only(top: 30),
            children: [
              Center(
                child: Text("Senfonia",
                    style: GoogleFonts.poppins(
                        fontSize: 30, color: ColorConstants.mainblue)),
              ),
              Container(
                height: 250,
                child: Image.asset("assets/images/christmas2.png"),
              ),
              RoundedInputField(
                hintText: "Your Email",
                controller: emailController,
              ),
              RoundedInputField(
                hintText: "Password",
                controller: passwordController,
                isPassword: true,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPasswordPage()));
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Forgot Password?",
                          style: GoogleFonts.poppins(
                              color: ColorConstants.mainblue)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              loading
                  ? CircularProgressIndicator()
                  : Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: StadiumBorder(),
                            primary: ColorConstants.mainblue),
                        onPressed: () async {
                          setState(() {
                            loading = true;
                          });
                          if (emailController.text == "" ||
                              passwordController.text == "") {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Please fill all the fields'),
                              backgroundColor: Colors.red,
                            ));
                          } else {
                            User? result = await AuthService().login(
                                emailController.text,
                                passwordController.text,
                                context);
                            if (result != null) {
                              print("success");
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const HomePage()),
                                  (route) => false);
                            }
                          }
                          setState(() {
                            loading = false;
                          });
                        },
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return RegisterPage();
                    }));
                  },
                  child: const Text(
                    'Are you not registered? Register here',
                    style: TextStyle(color: ColorConstants.secondaryColor),
                  )),
            ],
          )),
    );
  }
}
