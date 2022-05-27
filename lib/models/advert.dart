import 'package:cloud_firestore/cloud_firestore.dart';

class AdvertModel {
  String id;
  String title;
  String category;
  String description;
  Timestamp date;
  String userId;

  AdvertModel(
      {required this.id,
      required this.title,
      required this.category,
      required this.description,
      required this.date,
      required this.userId});

  factory AdvertModel.fromJson(DocumentSnapshot snapshot) {
    return AdvertModel(
      id: snapshot.id,
      title: snapshot['title'],
      category: snapshot['category'],
      description: snapshot['description'],
      date: snapshot['date'],
      userId: snapshot['userId'],
    );
  }
}
