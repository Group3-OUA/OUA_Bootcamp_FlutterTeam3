// import 'package:bootcamp_project/constants/color_constants.dart';
// import 'package:bootcamp_project/screens/about_us.dart';
// import 'package:bootcamp_project/screens/blog/blog_page.dart';
// import 'package:bootcamp_project/screens/register_page.dart';
// import 'package:bootcamp_project/services/auth_service.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// Drawer buildDrawer(BuildContext context) {
//   return Drawer(
//     backgroundColor: ColorConstants.lightgrey,
//     child: ListView(
//       padding: EdgeInsets.zero,
//       children: [
//         DrawerHeader(
//           decoration: BoxDecoration(
//             color: ColorConstants.lightblue,
//           ),
//           child: Center(
//             child: Text('Welcome to Blog App',
//                 style: GoogleFonts.poppins(
//                     fontSize: 20, color: ColorConstants.darkblue)),
//           ),
//         ),
//         ListTile(
//           title: TextButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => AboutUsPage(),

//                   // BlogPage(this.user)
//                 ),
//               );
//             },
//             child: Text("Biz Kimiz"),
//           ),
//           onTap: () {
//             // Update the state of the app
//             // ...
//             // Then close the drawer
//             Navigator.pop(context);
//           },
//         ),
//         ListTile(
//           title: TextButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => BlogPage(),

//                   // BlogPage(this.user)
//                 ),
//               );
//             },
//             child: Text("Biz Kimiz"),
//           ),
//           onTap: () {
//             // Update the state of the app
//             // ...
//             // Then close the drawer
//             Navigator.pop(context);
//           },
//         ),
//         TextButton.icon(
//           onPressed: () async {
//             await AuthService().signOut();
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) {
//                   return RegisterPage();
//                 },
//               ),
//             );
//           },
//           icon: const Icon(Icons.logout),
//           label: const Text("Sign Out"),
//           style: TextButton.styleFrom(primary: Colors.black),
//         ),
//       ],
//     ),
//   );
// }
