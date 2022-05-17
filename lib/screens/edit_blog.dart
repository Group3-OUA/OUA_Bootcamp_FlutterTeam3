import 'package:bootcamp_project/constants/color_constants.dart';
import 'package:bootcamp_project/models/blog.dart';
import 'package:bootcamp_project/services/firestore_service.dart';
import 'package:bootcamp_project/widgets/text_field_container.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditBlogPage extends StatefulWidget {
  BlogModel blog;
  EditBlogPage(this.blog);
  // const EditBlogPage({Key? key}) : super(key: key);

  @override
  State<EditBlogPage> createState() => _EditBlogPageState();
}

class _EditBlogPageState extends State<EditBlogPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    titleController.text = widget.blog.title;
    descriptionController.text = widget.blog.description;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.mainblue,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () async {
                await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Please confirm"),
                        content:
                            Text("Are you sure you want to delete this blog?"),
                        actions: [
                          TextButton(
                              onPressed: () async {
                                await FirestoreService()
                                    .deleteBlog(widget.blog.id);
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              child: Text("Yes")),
                          TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text("No"))
                        ],
                      );
                    });
              },
              icon: Icon(Icons.delete, color: Colors.red)),
        ],
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title",
                style: GoogleFonts.poppins(
                    fontSize: 20, color: ColorConstants.mainblue)),
            SizedBox(height: 30),
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
            TextFieldContainer(
              child: TextField(
                controller: descriptionController,
                minLines: 5,
                maxLines: 10,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            SizedBox(height: 10),
            loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          primary: ColorConstants.mainblue),
                      onPressed: () async {
                        if (titleController.text == "" ||
                            descriptionController.text == "") {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text("Please fill all the fields"),
                          ));
                        } else {
                          setState(() {
                            loading = true;
                          });
                          await FirestoreService().updateBlog(widget.blog.id,
                              titleController.text, descriptionController.text);
                          setState(() {
                            loading = false;
                          });
                          Navigator.pop(context);
                        }
                      },
                      child: Text(
                        "Update Note",
                        style: GoogleFonts.poppins(
                            fontSize: 20, color: Colors.white),
                      ),
                    ))
          ],
        ),
      )),
    );
  }
}
