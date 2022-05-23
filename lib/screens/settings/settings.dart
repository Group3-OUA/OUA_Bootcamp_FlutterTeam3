import 'package:bootcamp_project/widgets/build_AppBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        "Settings",
        Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.arrow_back_ios_new),
              onPressed: () {
                Navigator.pop(context);
                // print("open drawer");
              },
            );
          },
        ),
        Colors.transparent,
      ),
      body: Center(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2,
              child: ListTile(
                leading: Icon(Icons.person, color: Colors.black),
                title: Text(
                  "Profile",
                  style: GoogleFonts.poppins(),
                ),
                onTap: () {},
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                leading: Icon(Icons.sunny, color: Colors.black),
                title: Text(
                  "Dark Mode",
                  style: GoogleFonts.poppins(),
                ),
                onTap: () {},
              ),
            ),
          )
        ],
      )),
    );
  }
}
