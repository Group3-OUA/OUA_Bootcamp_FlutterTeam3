import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:bootcamp_project/constants/padding_constant.dart';
import 'package:bootcamp_project/models/advert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdvertDetailPage extends StatelessWidget {
  AdvertModel advert;
  AdvertDetailPage(this.advert);
  FirebaseFirestore firestore = FirebaseFirestore.instance;

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
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${advert.category}',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: 20,
                            color: ColorConstants.white,
                            fontWeight: FontWeight.bold)),
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
                Expanded(
                  child: Text(
                    '${advert.category}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color: ColorConstants.darkblue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            color: ColorConstants.darkblue.withOpacity(0.1),
            thickness: 1,
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text('${advert.title}',
                style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: ColorConstants.darkblue,
                    fontWeight: FontWeight.w500)),
          ),
          Padding(
            padding: PaddingConstant.padding20,
            child: Text(
              advert.description,
              style: GoogleFonts.poppins(
                  fontSize: 15, fontWeight: FontWeight.normal),
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
