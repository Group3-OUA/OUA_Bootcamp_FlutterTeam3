import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:bootcamp_project/widgets/text_field_container.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  // final ValueChanged<String> onChanged;
  final TextEditingController controller;
  final bool isPassword;
  const RoundedInputField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    required this.controller,
    this.isPassword = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: isPassword,
        controller: controller,
        // onChanged: onChanged,
        cursorColor: ColorConstants.lightblue,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: ColorConstants.lightblue,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
