import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  final String uid;
  final String name;
  final String businessType;
  final String email;
  final String mobileNo;
  final String address;
  final String location;
  final String password;
  final String confrimPassword;

  UserModel({
      required this.uid,
      required this.name,
      required this.businessType,
      required this.email,
      required this.mobileNo,
      required this.address,
      required this.location,
      required this.password,
      required this.confrimPassword});

 factory UserModel.fromMap(Map<String,dynamic>map){
    return UserModel(
        uid: map['uid'],
        name: map['name'],
        businessType: map['business'],
        email: map['email'],
        mobileNo: map['mobileNo'],
        address: map['address'],
        location: map['location'],
        password: map['password'],
        confrimPassword: map['confrimPassword']
    );
  }
  factory UserModel.fromSnapshot(DocumentSnapshot snap){
   var snapshot=snap.data() as Map<String,dynamic>;
    return UserModel(
        uid: snapshot['uid'],
        name: snapshot['name'],
        businessType: snapshot['business'],
        email: snapshot['email'],
        mobileNo: snapshot['mobileNo'],
        address: snapshot['address'],
        location: snapshot['location'],
        password: snapshot['password'],
        confrimPassword: snapshot['confrimPassword']
    );

  }
}