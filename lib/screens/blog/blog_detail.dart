import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:bootcamp_project/constants/padding_constant.dart';
import 'package:bootcamp_project/models/blog.dart';
import 'package:bootcamp_project/screens/blog/edit_blog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogDetail extends StatelessWidget {
  BlogModel blog;
  BlogDetail(this.blog);
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // const BlogDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                child: Center(
                  child: Text(
                    '${blog.title}',
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: ColorConstants.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: ColorConstants.secondaryColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
              ),
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: ColorConstants.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   children: [
              //     Image.asset(
              //       'assets/images/hug.png',
              //       // fit: BoxFit.cover,
              //       height: MediaQuery.of(context).size.height * 0.25,
              //       width: MediaQuery.of(context).size.width,
              //     ),
              //   ],
              // ),
            ],
          ),
          Padding(
            padding: PaddingConstant.padding20only,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${blog.title}',
                  style: GoogleFonts.poppins(
                      fontSize: 17,
                      color: ColorConstants.darkblue,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Divider(
            color: ColorConstants.darkblue.withOpacity(0.1),
            thickness: 1,
            height: 32,
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text('${blog.description}',
                  style: GoogleFonts.poppins(
                      fontSize: 15,
                      color: ColorConstants.darkblue,
                      fontWeight: FontWeight.w500)),
            ),
          ),
          Divider(
            color: ColorConstants.darkblue.withOpacity(0.1),
            thickness: 1,
            height: 32,
          ),
          Container(
            width: MediaQuery.of(context).size.height * 0.25,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Save"),
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
                primary: ColorConstants.secondaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
