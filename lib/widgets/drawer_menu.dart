import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:bootcamp_project/screens/about_us.dart';
import 'package:bootcamp_project/screens/advert/add_advert.dart';
import 'package:bootcamp_project/screens/advert/advert_view.dart';
import 'package:bootcamp_project/screens/auth/register_page.dart';
import 'package:bootcamp_project/screens/blog/blog_page.dart';
import 'package:bootcamp_project/services/auth_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerMenu extends StatelessWidget {
  User user;
  DrawerMenu(this.user);
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // const DrawerMenu({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      drawer: buildDrawerMenu(context),
    );
  }

  Drawer buildDrawerMenu(BuildContext context) {
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
              child: Text("Blogları Görüntüle"),
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
        ],
      ),
    );
  }
}
