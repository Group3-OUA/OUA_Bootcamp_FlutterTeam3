import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future insertNote(String title, String desciption, String userId) async {
    try {
      await firestore.collection("notes").add({
        'title': title,
        'description': desciption,
        'date': DateTime.now(),
        'userId': userId,
      });
    } catch (e) {}
    print("object");
  }

  Future updateBlog(String docId, String title, String description) async {
    try {
      await firestore.collection("notes").doc(docId).update({
        'title': title,
        'description': description,
      });
    } catch (e) {}
  }

  Future deleteBlog(String docId) async {
    try {
      await firestore.collection("notes").doc(docId).delete();
    } catch (e) {
      print(e);
    }
  }

  Future getBlog(String docId) async {
    try {
      await firestore.collection("notes").doc(docId).get();
    } catch (e) {
      print(e);
    }
  }
}
