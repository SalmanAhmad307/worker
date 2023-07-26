import 'package:cloud_firestore/cloud_firestore.dart';

class MechanicModel{
  final String uid;
  final String name;
  final String businessType;
  final String email;
  final String mobileNo;
  final String address;
  final String location;
  final String password;
  final String confrimPassword;

  MechanicModel({
    required this.uid,
    required this.name,
    required this.businessType,
    required this.email,
    required this.mobileNo,
    required this.address,
    required this.location,
    required this.password,
    required this.confrimPassword});

  factory MechanicModel.fromMap(Map<String,dynamic>map){
    return MechanicModel(
        uid: map['uid'],
        name: map['name'],
        businessType: map['businessType'],
        email: map['email'],
        mobileNo: map['mobileNo'],
        address: map['address'],
       location: map['location'],
        password: map['password'],
        confrimPassword: map['confrimPassword']
    );
  }
  factory MechanicModel.fromSnapshot(DocumentSnapshot snap){
    var snapshot=snap.data() as Map<String,dynamic>;
    return MechanicModel(
        uid: snapshot['uid'],
        name: snapshot['name'],
        businessType: snapshot['businessType'],
        email: snapshot['email'],
        mobileNo: snapshot['mobileNo'],
        address: snapshot['address'],
        location:snapshot['location'],
        password: snapshot['password'],
        confrimPassword: snapshot['confrimPassword']
    );

  }


}