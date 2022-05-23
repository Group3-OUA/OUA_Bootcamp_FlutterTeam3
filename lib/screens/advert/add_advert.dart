import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:bootcamp_project/services/firestore_service.dart';
import 'package:bootcamp_project/widgets/build_AppBar.dart';
import 'package:bootcamp_project/widgets/text_field_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddAdvertPage extends StatefulWidget {
  User user;
  AddAdvertPage(this.user);

  // const AddBlogPage({Key? key}) : super(key: key);

  @override
  State<AddAdvertPage> createState() => _AddAdvertPageState();
}

class _AddAdvertPageState extends State<AddAdvertPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController categoryController = TextEditingController();

  final items = ['Electronics', 'Fashion', 'Books', 'Sports', 'Others'];
  String? value;

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "İlan Ekle", Builder(
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
            // Container(
            //   child: DropdownButton<String>(
            //     items: items.map(buildDropdownMenuItem).toList(),
            //     onChanged: (value) => setState(() => this.value = value),
            //     value: value,
            //     isExpanded: true,
            //     icon: Icon(Icons.arrow_drop_down),
            //     iconSize: 36,
            //   ),
            // ),
            SizedBox(height: 10),
            Text("Category",
                style: GoogleFonts.poppins(
                    fontSize: 20, color: ColorConstants.mainblue)),
            SizedBox(height: 10),
            SizedBox(
              child: TextFieldContainer(
                child: TextField(
                  controller: categoryController,
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
                        categoryController.text == "") {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Please fill all the fields"),
                      ));
                    } else {
                      setState(() {
                        loading = true;
                        print("object");
                      });
                      await FirestoreService().insertAdvert(
                        titleController.text,
                        categoryController.text,
                        widget.user.uid,
                      );

                      setState(() {
                        loading = false;
                      });
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    "Add Advert",
                    style:
                        GoogleFonts.poppins(fontSize: 20, color: Colors.white),
                  ),
                ))
          ],
        ),
      )),
    );
  }

  DropdownMenuItem<String> buildDropdownMenuItem(String item) {
    return DropdownMenuItem<String>(
      value: item,
      child: Text(item),
    );
  }
}
