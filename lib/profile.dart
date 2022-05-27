import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:bootcamp_project/models/users.dart';
import 'package:bootcamp_project/widgets/build_AppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  // User user;
  // ProfilePage(this.user);
  FirebaseAuth auth = FirebaseAuth.instance;
  final double coverHeight = 280;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    var userID = auth.currentUser!.uid.toString();

    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('Users')
          .where('UserID', isEqualTo: userID)
          .snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          UserModel userModel = UserModel.fromJson(snapshot.data.docs[0]);
          return Center(
            child: Text(userModel.nickName),
          );
        } else {
          return Center(
            child: Text("No Data"),
          );
        }
      },
    )
        // appBar: buildAppBar(
        //   context,
        //   "",
        //   Builder(
        //     builder: (context) {
        //       return IconButton(
        //         icon: SvgPicture.asset("assets/icons/Drawer.svg"),
        //         onPressed: () {
        //           // print("open drawer");
        //         },
        //       );
        //     },
        //   ),
        //   Colors.transparent,
        // ),
        //     body: ListView(
        //   padding: EdgeInsets.zero,
        //   children: [
        //     buildTop(),
        //     Column(
        //       children: [
        //         SizedBox(height: 80),
        //         Text(
        //           "Profile",
        //           style: GoogleFonts.poppins(
        //               fontSize: 18,
        //               color: ColorConstants.black,
        //               fontWeight: FontWeight.normal),
        //         ),
        //         Text(
        //           "Flutter Software Engineer",
        //           style: GoogleFonts.poppins(
        //               fontSize: 15,
        //               color: Colors.grey,
        //               fontWeight: FontWeight.normal),
        //         ),
        //       ],
        //     )
        //   ],
        // )
        );
  }

  Stack buildTop() {
    final top = coverHeight - profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        buildCoverImage(),
        Positioned(top: top, child: buildProfileImage())
      ],
    );
  }

  CircleAvatar buildProfileImage() {
    return CircleAvatar(
      radius: profileHeight / 2,
      backgroundColor: Colors.grey.shade800,
      backgroundImage: NetworkImage(
        "https://www.gravatar.com/avatar/205e460b479e2e5b48aec07710c08d50?s=200",
      ),
    );
  }

  Container buildCoverImage() {
    return Container(
      color: Colors.grey,
      child: Image.network(
        'https://picsum.photos/250?image=9',
        width: double.infinity,
        height: coverHeight,
        fit: BoxFit.cover,
      ),
    );
  }
}
