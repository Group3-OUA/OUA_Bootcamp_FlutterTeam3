import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:bootcamp_project/models/advert.dart';
import 'package:bootcamp_project/screens/advert/add_advert.dart';
import 'package:bootcamp_project/screens/advert/advert_detail.dart';
import 'package:bootcamp_project/widgets/build_AppBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdvertViewPage extends StatelessWidget {
  User user;
  AdvertViewPage(this.user);
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  // const AdvertViewPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: buildAppBar(context, "İlanları Görüntüle", Builder(
        builder: (context) {
          return IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          );
        },
      ), Colors.transparent),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('adverts')
              .where('UserId')
              // .where('userId', isEqualTo: user?.uid)
              .snapshots(),
          builder: (context, AsyncSnapshot snapShot) {
            if (snapShot.hasData) {
              if (snapShot.data.docs.length > 0) {
                return ListView.builder(
                    itemCount: snapShot.data.docs.length,
                    itemBuilder: (context, index) {
                      AdvertModel advert =
                          AdvertModel.fromJson(snapShot.data.docs[index]);
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
                            trailing: Column(
                              children: [
                                //this adverts order

                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    firestore
                                        .collection('adverts')
                                        .doc(advert.id)
                                        .delete();
                                  },
                                ),
                              ],
                            ),
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://picsum.photos/250?image=5"),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            title: Text(
                              advert.category,
                              style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  color: ColorConstants.mainblue),
                            ),
                            subtitle: Text(
                              advert.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: ColorConstants.black),
                            ),
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      AdvertDetailPage(advert)));
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Visibility(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            backgroundColor: ColorConstants.white,
            child: Icon(
              Icons.add,
              color: ColorConstants.darkblue,
            ),
            onPressed: () {
              // Navigator.of(context).pushNamed('/addAdvert');
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddAdvertPage(user!)));
            },
          ),
        ),
      ),
      bottomNavigationBar: buildBottomNavBar(),
    );
  }
}
