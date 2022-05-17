import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:bootcamp_project/models/blog.dart';
import 'package:bootcamp_project/screens/about_us.dart';
import 'package:bootcamp_project/screens/add_blog.dart';
import 'package:bootcamp_project/screens/blog/blog_detail.dart';
import 'package:bootcamp_project/screens/blog/blog_page.dart';
import 'package:bootcamp_project/screens/edit_blog.dart';
import 'package:bootcamp_project/screens/register_page.dart';
import 'package:bootcamp_project/services/auth_service.dart';
import 'package:bootcamp_project/widgets/build_AppBar.dart';
import 'package:bootcamp_project/widgets/hidden_drawer_menu.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        // drawer: Drawer(
        //   semanticLabel: 'Drawer',
        //   // backgroundColor: ColorConstants.lightblue,
        //   // Add a ListView to the drawer. This ensures the user can scroll
        //   // through the options in the drawer if there isn't enough vertical
        //   // space to fit everything.
        //   child: ListView(
        //     // Important: Remove any padding from the ListView.
        //     padding: EdgeInsets.zero,
        //     children: [
        //       const DrawerHeader(
        //         decoration: BoxDecoration(
        //           color: Colors.blue,
        //         ),
        //         child: Text('Drawer Header'),
        //       ),
        //       ListTile(
        //         title: const Text('Item 1'),
        //         onTap: () {
        //           // Update the state of the app.
        //           // ...
        //         },
        //       ),
        //       ListTile(
        //         title: const Text('Item 2'),
        //         onTap: () {
        //           // Update the state of the app.
        //           // ...
        //         },
        //       ),
        //     ],
        //   ),
        // ),
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
        body: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('notes')
                .where('userId', isEqualTo: user?.uid)
                .snapshots(),
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
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            color: ColorConstants.lightgrey,
                            elevation: 3,
                            margin: EdgeInsets.all(15),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    "https://picsum.photos/250?image=5"),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              title: Text(
                                blog.title,
                                style: GoogleFonts.poppins(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                blog.description,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              ),
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => BlogDetail(blog)));
                              },
                            ),
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

  Drawer buildDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: ColorConstants.lightgrey,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: ColorConstants.lightblue,
            ),
            child: Center(
              child: Text('Welcome to Blog App',
                  style: GoogleFonts.poppins(
                      fontSize: 20, color: ColorConstants.darkblue)),
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
              child: Text("Biz Kimiz"),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.pop(context);
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
            label: const Text("Sign Out"),
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