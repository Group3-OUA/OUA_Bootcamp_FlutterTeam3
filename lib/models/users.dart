import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String email;
  String fullName;
  String nickName;
  String userId;

  UserModel(
      {required this.email,
      required this.fullName,
      required this.nickName,
      required this.userId});

  factory UserModel.fromJson(DocumentSnapshot snapshot) {
    return UserModel(
      email: snapshot['Email'],
      fullName: snapshot['Fullname'],
      nickName: snapshot['NickName'],
      userId: snapshot['UserID'],
    );
  }
}
