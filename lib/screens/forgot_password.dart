import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:bootcamp_project/widgets/build_AppBar.dart';
import 'package:bootcamp_project/widgets/rounded_input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());

      showDialog(
          context: this.context,
          builder: (context) {
            return AlertDialog(
              title: Text("Password Reset"),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: this.context,
          builder: (context) {
            return AlertDialog(
              title: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password"),
        backgroundColor: ColorConstants.secondaryColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              'Enter Your Email and we will send you a link ',
              textAlign: TextAlign.center,
            ),
          ),
          RoundedInputField(
            hintText: "Your Email",
            controller: emailController,
          ),
          MaterialButton(
            onPressed: () {
              passwordReset();
            },
            child: Text('Reset Password'),
            color: ColorConstants.mainblue,
          )
        ],
      ),
    );
  }
}
