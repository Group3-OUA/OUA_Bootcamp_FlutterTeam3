import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:bootcamp_project/constants/padding_constant.dart';
import 'package:bootcamp_project/screens/home_page.dart';
import 'package:bootcamp_project/screens/login_page.dart';
import 'package:bootcamp_project/services/auth_service.dart';
import 'package:bootcamp_project/widgets/build_AppBar.dart';
import 'package:bootcamp_project/widgets/rounded_input_field.dart';
import 'package:bootcamp_project/widgets/text_field_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //const RegisterPage({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: buildAppBar(
        //   context,
        //   "Register",
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
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Senfonia",
                style: GoogleFonts.poppins(fontSize: 30, color: Colors.blue)),
            Container(
              height: 250,
              child: Image.asset("assets/images/christmas2.png"),
            ),
            // TextFieldContainer(child: emailFiels()),

            RoundedInputField(
              hintText: "Your Email",
              controller: emailController,
            ),
            RoundedInputField(
              hintText: "Password",
              controller: passwordController,
              isPassword: true,
            ),
            RoundedInputField(
              hintText: "Confirm Password",
              controller: confirmPasswordController,
              isPassword: true,
            ),
            loading
                ? const CircularProgressIndicator()
                : SizedBox(
                    height: 40,
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
                        } else if (passwordController.text !=
                            confirmPasswordController.text) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text('Passwords do not match'),
                            backgroundColor: Colors.red,
                          ));
                        } else {
                          User? result = await AuthService().register(
                              emailController.text,
                              passwordController.text,
                              context);
                          if (result != null) {
                            print("success");
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()),
                                (route) => false);
                          }
                        }
                        setState(() {
                          loading = false;
                        });
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
            TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                },
                child: const Text(
                  'Already have an account? Login',
                  style: TextStyle(color: ColorConstants.secondaryColor),
                )),
            loading
                ? CircularProgressIndicator()
                : SignInButton(Buttons.Google, text: " Continue With Google",
                    onPressed: () async {
                    setState(() {
                      loading = true;
                    });

                    await AuthService().signInWithGoogle();
                    setState(() {
                      loading = false;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return HomePage();
                        },
                      ),
                    );
                  }),
          ],
        ),
      ),
    ));
  }

  TextField confirmPasswordFiels() {
    return TextField(
      obscureText: true,
      controller: confirmPasswordController,
      decoration: const InputDecoration(
        labelText: 'Confirm Password',
        border: InputBorder.none,
      ),
    );
  }

  TextField passwordFields() {
    return TextField(
      obscureText: true,
      controller: passwordController,
      decoration: const InputDecoration(
        labelText: 'Password',
        border: InputBorder.none,
      ),
    );
  }

  TextField emailFiels() {
    return TextField(
      controller: emailController,
      decoration: const InputDecoration(
        labelText: 'Email',
        border: InputBorder.none,
      ),
    );
  }
}
