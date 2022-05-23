import 'package:cloud_firestore/cloud_firestore.dart';

class AdvertModel {
  String id;
  String title;
  String category;
  Timestamp date;
  String userId;

  AdvertModel(
      {required this.id,
      required this.title,
      required this.category,
      required this.date,
      required this.userId});

  factory AdvertModel.fromJson(DocumentSnapshot snapshot) {
    return AdvertModel(
      id: snapshot.id,
      title: snapshot['title'],
      category: snapshot['category'],
      date: snapshot['date'],
      userId: snapshot['userId'],
    );
  }
}
