import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:bootcamp_project/services/firestore_service.dart';
import 'package:bootcamp_project/widgets/build_AppBar.dart';
import 'package:bootcamp_project/widgets/text_field_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddBlogPage extends StatefulWidget {
  User user;
  AddBlogPage(this.user);

  // const AddBlogPage({Key? key}) : super(key: key);

  @override
  State<AddBlogPage> createState() => _AddBlogPageState();
}

class _AddBlogPageState extends State<AddBlogPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Blog Ekle", Builder(
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
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                height: 200,
                child: Image.asset("assets/images/christmas2.png"),
              ),
            ),
            Text("Title",
                style: GoogleFonts.poppins(
                    fontSize: 20, color: ColorConstants.mainblue)),
            SizedBox(height: 10),
            TextFieldContainer(
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 10),
            Text("Description",
                style: GoogleFonts.poppins(
                    fontSize: 20, color: ColorConstants.mainblue)),
            SizedBox(height: 10),
            SizedBox(
              child: TextFieldContainer(
                child: TextField(
                  controller: descriptionController,
                  minLines: 5,
                  maxLines: 10,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(), primary: ColorConstants.mainblue),
                  onPressed: () async {
                    if (titleController.text == "" ||
                        descriptionController.text == "") {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Please fill all the fields"),
                      ));
                    } else {
                      setState(() {
                        loading = true;
                        print("object");
                      });
                      await FirestoreService().insertNote(titleController.text,
                          descriptionController.text, widget.user.uid);

                      setState(() {
                        loading = false;
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    "Add Note",
                    style:
                        GoogleFonts.poppins(fontSize: 20, color: Colors.white),
                  ),
                ))
          ],
        ),
      )),
    );
  }
}
