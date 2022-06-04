import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:bootcamp_project/screens/about_us.dart';
import 'package:flutter/material.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget page;

  const ProfileListItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => page,
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          width: size.width * 0.87,
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(
            color: ColorConstants.lightblue,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Icon(icon),
              SizedBox(
                width: 10,
              ),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }
}
