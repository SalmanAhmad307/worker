import 'package:cloud_firestore/cloud_firestore.dart';

class WorkerModel{
  final String uid;
  final String name;
  final String businessType;
  final String email;
  final String mobileNo;
  final String address;
  final double lati;
  final double longi;
  final String password;
  final String confrimPassword;

  WorkerModel({
    required this.uid,
    required this.name,
    required this.businessType,
    required this.email,
    required this.mobileNo,
    required this.address,
    required this.lati,
    required this.longi,
    required this.password,
    required this.confrimPassword});

  factory WorkerModel.fromMap(Map<String,dynamic>map){
    return WorkerModel(
        uid: map['uid'],
        name: map['name'],
        businessType: map['businessType'],
        email: map['email'],
        mobileNo: map['mobileNo'],
        address: map['address'],
        lati: map['lati'],
        longi: map['longi'],
        password: map['password'],
        confrimPassword: map['confrimPassword']
    );
  }
  factory WorkerModel.fromSnapshot(DocumentSnapshot snap){
    var snapshot=snap.data() as Map<String,dynamic>;
    return WorkerModel(
        uid: snapshot['uid'],
        name: snapshot['name'],
        businessType: snapshot['business'],
        email: snapshot['email'],
        mobileNo: snapshot['mobileNo'],
        address: snapshot['address'],
        lati: snapshot['lati'],
        longi: snapshot['longi'],
        password: snapshot['password'],
        confrimPassword: snapshot['confrimPassword']
    );

  }


}