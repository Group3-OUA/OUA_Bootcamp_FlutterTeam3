import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:bootcamp_project/constants/padding_constant.dart';
import 'package:bootcamp_project/models/blog.dart';
import 'package:bootcamp_project/models/users.dart';
import 'package:bootcamp_project/screens/about_us.dart';
import 'package:bootcamp_project/screens/auth/register_page.dart';
import 'package:bootcamp_project/screens/blog/blog_page.dart';
import 'package:bootcamp_project/screens/blog/edit_blog.dart';
import 'package:bootcamp_project/screens/settings/settings.dart';
import 'package:bootcamp_project/services/auth_service.dart';
import 'package:bootcamp_project/widgets/build_AppBar.dart';
import 'package:bootcamp_project/widgets/profile_list_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatelessWidget {
  User user;
  ProfilePage(this.user);
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  FirebaseAuth auth = FirebaseAuth.instance;
  final double coverHeight = 280;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    var userID = auth.currentUser!.uid.toString();
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('Users')
            .where('UserID', isEqualTo: userID)
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            UserModel userModel = UserModel.fromJson(snapshot.data.docs[0]);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        icon: Icon(Icons.arrow_back_ios_new_outlined),
                        color: ColorConstants.black,
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    IconButton(
                        icon: Icon(Icons.nights_stay_outlined),
                        color: ColorConstants.black,
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ],
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    buildProfileImage(),
                    SizedBox(
                      width: 10,
                    ),
                    Center(
                      child: Text(
                        "${userModel.nickName} ",
                        style: GoogleFonts.poppins(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "${userModel.email} ",
                      style: GoogleFonts.poppins(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: [
                      ProfileListItem(
                        icon: Icons.person,
                        text: "Profile",
                        page: ProfilePage(this.user),
                      ),
                      const ProfileListItem(
                        icon: Icons.settings,
                        text: "Settings",
                        page: SettingPage(),
                      ),
                      const ProfileListItem(
                        icon: Icons.help_outline,
                        text: "Help & Support",
                        page: AboutUsPage(),
                      ),
                      const ProfileListItem(
                        icon: Icons.inventory_outlined,
                        text: "İnvite a Friend",
                        page: AboutUsPage(),
                      ),
                      ProfileListItem(
                        icon: Icons.inventory_outlined,
                        text: "See your blogs",
                        page: BlogPage(this.user),
                      ),
                      TextButton.icon(
                        onPressed: () async {
                          await AuthService().signOut();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return RegisterPage();
                              },
                            ),
                          );
                        },
                        icon: const Icon(Icons.logout),
                        label: const Text("Çıkış Yap"),
                        style: TextButton.styleFrom(primary: Colors.black),
                      ),
                    ],
                  ),
                )

                // notes collection get data from firestore

                // StreamBuilder(
                //     stream: FirebaseFirestore.instance
                //         .collection('notes')
                //         .where('userId', isEqualTo: userID)
                //         .snapshots(),
                //     builder: (context, AsyncSnapshot snapShot) {
                //       if (snapShot.hasData) {
                //         return ListView.builder(
                //             itemCount: snapshot.data.docs.length,
                //             itemBuilder: (context, index) {
                //               BlogModel blogModel =
                //                   BlogModel.fromJson(snapshot.data.docs[index]);
                //               return Padding(
                //                 padding:
                //                     const EdgeInsets.symmetric(horizontal: 10),
                //                 child: Card(
                //                   shape: RoundedRectangleBorder(
                //                     borderRadius: BorderRadius.circular(15.0),
                //                   ),
                //                   color: ColorConstants.lightgrey,
                //                   elevation: 3,
                //                   margin: EdgeInsets.all(15),
                //                   child: ListTile(
                //                     leading: CircleAvatar(
                //                       backgroundImage: NetworkImage(
                //                           "https://picsum.photos/250?image=9"),
                //                     ),
                //                     contentPadding: EdgeInsets.symmetric(
                //                         horizontal: 10, vertical: 5),
                //                     title: Text(
                //                       blogModel.title,
                //                       style: GoogleFonts.poppins(
                //                           fontSize: 15,
                //                           fontWeight: FontWeight.bold),
                //                     ),
                //                     subtitle: Text(
                //                       blogModel.description,
                //                       overflow: TextOverflow.ellipsis,
                //                       maxLines: 2,
                //                       style: GoogleFonts.poppins(
                //                           fontSize: 14,
                //                           fontWeight: FontWeight.normal),
                //                     ),
                //                     onTap: () {
                //                       // Navigator.of(context).push(
                //                       //     MaterialPageRoute(
                //                       //         builder: (context) =>
                //                       //             EditBlogPage(blogModel))
                //                       //             );
                //                     },
                //                   ),
                //                 ),
                //               );
                //             });
                //       } else {
                //         return Center(child: Text("No data found"));
                //       }
                //     }),
              ],
            );
          } else {
            return Center(
              child: Text("No Data"),
            );
          }
        },
      ),
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
            onPressed: () {},
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomNavBar(),
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
      radius: profileHeight / 4,
      backgroundColor: Colors.grey.shade800,
      backgroundImage: NetworkImage(
        "https://picsum.photos/250?image=9",
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
