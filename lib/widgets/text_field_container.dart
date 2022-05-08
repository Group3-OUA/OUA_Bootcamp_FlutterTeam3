import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.87,
      height: MediaQuery.of(context).size.height * 0.08,
      decoration: BoxDecoration(
        color: ColorConstants.lightblue,
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }
}
