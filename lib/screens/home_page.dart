import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:bootcamp_project/models/blog.dart';
import 'package:bootcamp_project/models/users.dart';
import 'package:bootcamp_project/profile.dart';
import 'package:bootcamp_project/screens/about_us.dart';
import 'package:bootcamp_project/screens/advert/add_advert.dart';
import 'package:bootcamp_project/screens/advert/advert_view.dart';
import 'package:bootcamp_project/screens/blog/add_blog.dart';
import 'package:bootcamp_project/screens/blog/blog_detail.dart';
import 'package:bootcamp_project/screens/blog/blog_intro.dart';
import 'package:bootcamp_project/screens/blog/blog_page.dart';
import 'package:bootcamp_project/screens/blog/edit_blog.dart';
import 'package:bootcamp_project/screens/auth/register_page.dart';
import 'package:bootcamp_project/screens/obstacles/find_mentor.dart';
import 'package:bootcamp_project/screens/obstacles/find_workshop.dart';
import 'package:bootcamp_project/screens/obstacles/obstacles.dart';
import 'package:bootcamp_project/services/auth_service.dart';
import 'package:bootcamp_project/widgets/build_AppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart ';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

class HomePage extends StatelessWidget {
  User user;

  HomePage(this.user);
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      drawer: buildDrawer(context),
      appBar: buildAppBar(
        context,
        "Explore",
        Builder(
          builder: (context) {
            return IconButton(
              icon: SvgPicture.asset("assets/icons/Drawer.svg"),
              onPressed: () {
                Scaffold.of(context).openDrawer();
                // print("open drawer");
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Blog Paylaş! İlan Paylaş! Engelleri Aş!",
                    textAlign: TextAlign.start,
                    style: GoogleFonts.poppins(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color: ColorConstants.black,
                    ),
                  ),
                  Text(
                    "Birlikte Yapacağımız Müzik Atolyeleri ile\n Engelleri Birlikte Aşalım ",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: ColorConstants.mainblue,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlogPage(this.user),
                  ),
                );
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: ColorConstants.categorypurple,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.height * 0.2,
                child: Center(
                    child: Text(
                  "Blogları Gör",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: ColorConstants.white,
                  ),
                )),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FindMentor(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: ColorConstants.secondaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    width: MediaQuery.of(context).size.width * 0.43,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Center(
                        child: Text(
                      "Mentor Bul",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.white,
                      ),
                    )),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FindWorkshop(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      color: ColorConstants.categorypurple,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    width: MediaQuery.of(context).size.width * 0.43,
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Center(
                        child: Text(
                      "Atolye Bul",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.white,
                      ),
                    )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      // body: StreamBuilder(
      //     stream: FirebaseFirestore.instance
      //         .collection('notes')
      //         .where('userId', isEqualTo: user?.uid)
      //         .snapshots(),
      //     builder: (context, AsyncSnapshot snapShot) {
      //       if (snapShot.hasData) {
      //         if (snapShot.data.docs.length > 0) {
      //           return ListView.builder(
      //               itemCount: snapShot.data.docs.length,
      //               itemBuilder: (context, index) {
      //                 BlogModel blog =
      //                     BlogModel.fromJson(snapShot.data.docs[index]);

      //                 return Padding(
      //                   padding: const EdgeInsets.symmetric(horizontal: 10),
      //                   child: Card(
      //                     shape: RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.circular(15.0),
      //                     ),
      //                     color: ColorConstants.lightgrey,
      //                     elevation: 3,
      //                     margin: EdgeInsets.all(15),
      //                     child: ListTile(
      //                       leading: CircleAvatar(
      //                         backgroundImage: NetworkImage(
      //                             "https://picsum.photos/250?image=6"),
      //                       ),
      //                       contentPadding: EdgeInsets.symmetric(
      //                           horizontal: 10, vertical: 5),
      //                       title: Text(
      //                         blog.title,
      //                         style: GoogleFonts.poppins(
      //                             fontSize: 15, fontWeight: FontWeight.bold),
      //                       ),
      //                       subtitle: Text(
      //                         blog.description,
      //                         overflow: TextOverflow.ellipsis,
      //                         maxLines: 2,
      //                         style: GoogleFonts.poppins(
      //                             fontSize: 14, fontWeight: FontWeight.normal),
      //                       ),
      //                       onTap: () {
      //                         Navigator.of(context).push(MaterialPageRoute(
      //                             builder: (context) => BlogDetail(blog)));
      //                       },
      //                     ),
      //                   ),
      //                 );
      //               });
      //         } else {
      //           return Center(child: Text("No data found"));
      //         }
      //       }
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }),
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
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddBlogPage(user!)));
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: buildBottomNavBar(),
    );
  }

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: ColorConstants.lightgrey,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              color: ColorConstants.secondaryColor,
            ),
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    "assets/icons/senfonia.png",
                  ),
                  // Text('Welcome to Senfonia ',
                  //     style: GoogleFonts.poppins(
                  //         fontSize: 20, color: ColorConstants.white)),
                ],
              ),
            ),
          ),
          ListTile(
            title: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutUsPage(),

                    // BlogPage(this.user)
                  ),
                );
              },
              child: Text("Biz Kimiz"),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlogPage(this.user),

                    // BlogPage(this.user)
                  ),
                );
              },
              child: Text("Blogları Görüntüle"),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddAdvertPage(this.user),

                    // BlogPage(this.user)
                  ),
                );
              },
              child: Text("İlan Ekle"),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdvertViewPage(this.user),

                    // BlogPage(this.user)
                  ),
                );
              },
              child: Text("İlanları Gör"),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlogIntro(),

                    // BlogPage(this.user)
                  ),
                );
              },
              child: Text("Blog Intro "),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ObstaclesScreen(),

                    // BlogPage(this.user)
                  ),
                );
              },
              child: Text("Engelleri Aş"),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
            },
          ),
          ListTile(
            title: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(this.user),

                    // BlogPage(this.user)
                  ),
                );
              },
              child: Text("Profil"),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
            },
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
    );
  }
}



              // Card(
              //   color: ColorConstants.lightblue,
              //   elevation: 5,
              //   margin: EdgeInsets.all(10),
              //   child: ListTile(
              //     contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              //     title: Text(
              //       "Build a new app",
              //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              //     ),
              //     subtitle: Text(
              //       "Learn to build a new app with Flutter",
              //       overflow: TextOverflow.ellipsis,
              //       maxLines: 2,
              //     ),
              //     onTap: () {
              //       Navigator.of(context).push(
              //           MaterialPageRoute(builder: (context) => EditBlogPage()));
              //     },
              //   ),
              // )
        


          //   Center(
                // child: Text(user != null ? 'Welcome ${user.email}' : ''),
                
                //  ),