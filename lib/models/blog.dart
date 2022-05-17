import 'package:cloud_firestore/cloud_firestore.dart';

class BlogModel {
  String id;
  String title;
  String description;
  Timestamp date;
  String userId;

  BlogModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.date,
      required this.userId});

  factory BlogModel.fromJson(DocumentSnapshot snapshot) {
    return BlogModel(
      id: snapshot.id,
      title: snapshot['title'],
      description: snapshot['description'],
      date: snapshot['date'],
      userId: snapshot['userId'],
    );
  }
}
