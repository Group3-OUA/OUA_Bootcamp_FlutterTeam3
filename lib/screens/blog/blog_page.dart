import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:bootcamp_project/constants/padding_constant.dart';
import 'package:bootcamp_project/models/blog.dart';
import 'package:bootcamp_project/models/users.dart';
import 'package:bootcamp_project/screens/about_us.dart';
import 'package:bootcamp_project/screens/blog/add_blog.dart';
import 'package:bootcamp_project/screens/blog/blog_detail.dart';
import 'package:bootcamp_project/screens/blog/edit_blog.dart';
import 'package:bootcamp_project/screens/home_page.dart';
import 'package:bootcamp_project/screens/auth/register_page.dart';
import 'package:bootcamp_project/services/auth_service.dart';
import 'package:bootcamp_project/widgets/build_AppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogPage extends StatelessWidget {
  User user;
  BlogPage(this.user);
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var userID = auth.currentUser!.uid.toString();

    final user = FirebaseAuth.instance.currentUser;
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
        appBar: buildAppBar(
          context,
          "Bloglar",
          Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.arrow_back_ios_sharp),
                onPressed: () {
                  Navigator.pop(context);
                  // print("open drawer");
                },
              );
            },
          ),
          Colors.transparent,
        ),
        body: StreamBuilder(
            stream: FirebaseFirestore.instance.collection('notes').snapshots(),
            builder: (context, AsyncSnapshot snapShot) {
              if (snapShot.hasData) {
                if (snapShot.data.docs.length > 0) {
                  return ListView.builder(
                      itemCount: snapShot.data.docs.length,
                      itemBuilder: (context, index) {
                        BlogModel blog =
                            BlogModel.fromJson(snapShot.data.docs[index]);
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Column(
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    color: ColorConstants.lightgrey,
                                    elevation: 3,
                                    margin: EdgeInsets.all(15),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "https://picsum.photos/250?image=9"),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      title: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          StreamBuilder(
                                            stream: FirebaseFirestore.instance
                                                .collection('Users')
                                                .where('UserID',
                                                    isEqualTo: blog.userId)
                                                .snapshots(),
                                            builder: (context,
                                                AsyncSnapshot snapshot) {
                                              if (snapshot.hasData) {
                                                UserModel userModel =
                                                    UserModel.fromJson(
                                                        snapshot.data.docs[0]);
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "Yazar - ${userModel.fullName} ",
                                                          style: GoogleFonts
                                                              .poppins(
                                                            fontSize: 14,
                                                            color:
                                                                ColorConstants
                                                                    .black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                        ),
                                                        Text(snapShot
                                                            .data.docs.length
                                                            .toString())
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                  ],
                                                );
                                              } else {
                                                return Center(
                                                  child: Text("No Data"),
                                                );
                                              }
                                            },
                                          ),
                                          Text(
                                            blog.title,
                                            style: GoogleFonts.poppins(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                      subtitle: Text(
                                        blog.description,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    EditBlogPage(blog)));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      });
                } else {
                  return Center(child: Text("No data found"));
                }
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
        floatingActionButton: Visibility(
          visible: !keyboardIsOpen,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              child: const Icon(
                Icons.add,
                color: ColorConstants.darkblue,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddBlogPage(user!)));
              },
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: buildBottomNavBar());
  }
}
