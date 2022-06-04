import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

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

  Future insertAdvert(
      String title, String category, String description, String userId) async {
    try {
      await firestore.collection("adverts").add({
        'title': title,
        'date': DateTime.now(),
        'category': category,
        'description': description,
        'userId': userId,
      });
    } catch (e) {}
    print("object");
  }

  Future addUser(String email, String nickName, String name) async {
    var userID = auth.currentUser!.uid.toString();
    final user = {
      'Email': email.trim(),
      'NickName': nickName.trim(),
      'Fullname': name.trim(),
      'UserID': userID.toString(),
    };
    try {
      firestore.collection('Users').doc(userID).set(user);
    } catch (e) {
      print(e);
    }
  }

  CollectionReference _collectionRef =
      FirebaseFirestore.instance.collection('notes');
  Future<void> getData() async {
    // Get docs from collection reference
    QuerySnapshot querySnapshot = await _collectionRef.get();
    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    print(allData);
  }
}
