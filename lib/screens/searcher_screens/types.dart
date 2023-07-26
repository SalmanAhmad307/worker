import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models/location.dart';
import '../../models/worker_model.dart';
import '../../models/worker_model_send.dart';
class Types extends StatefulWidget {
  const Types({Key? key}) : super(key: key);

  @override
  State<Types> createState() => _TypesState();
}

class _TypesState extends State<Types> {
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  static const LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  late GoogleMapController _controller;
  final Location _location=Location();
  String address = "";
  Iterable markers = [];
  late Iterable _markers;
  List mechanicList=<MechanicModel>[];
  void _onMapCreated(GoogleMapController cntlr) {
    _controller = cntlr;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude!, l.longitude!),zoom: 15),
        ),
      );

    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Type',
        ),
        backgroundColor: Colors.teal,
      ),
      body: StreamBuilder(
        stream:FirebaseFirestore.instance.collection('users').snapshots() ,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
          var list = <WorkerModel>[];
          if(snapshot.hasData && !snapshot.hasError){
            for (var i = 0; i < snapshot.data!.docs.length; i++) {
              for (var i = 0; i < snapshot.data!.docs.length; i++) {
                var newData=snapshot.data!.docs[i];
                var location = newData['location'];
                List<String> dateParts = location.split(",");
                double latitude  = double.parse(dateParts[0]);
                double longitude=double.parse(dateParts[1]);

                WorkerModel userModel=WorkerModel(uid: newData['uid'], name: newData['name'],
                    businessType: newData['businessType'],
                    email: newData['email'], mobileNo: newData['mobileNo'],
                    address: newData['address'],
                    lati: latitude, longi:longitude , password: newData['password'],
                    confrimPassword: "");
                list.add(userModel);
              }
              var mechanicData=snapshot.data!.docs[i];
              var businessType = mechanicData['businessType'];
              MechanicModel mechanicModel=
              MechanicModel(
                uid:mechanicData['uid'],
                name: mechanicData['name'],
                businessType: mechanicData['businessType'],
                email: mechanicData['email'],
                mobileNo: mechanicData['mobileNo'],
                address: mechanicData['address'],
                location: mechanicData['location'],
                password: mechanicData['password'],
                confrimPassword: mechanicData['confirmPassword'],
              );
            print( mechanicData.data());
            Fluttertoast.showToast(msg: mechanicData.data().toString());
              mechanicList.add(mechanicModel);
              print('Mechanic lis is :${mechanicList.first}');
              Fluttertoast.showToast(msg: 'Mechanic lis is :${mechanicList.first}');
              print('Mechanic lis is :${mechanicList.iterator}');
              Fluttertoast.showToast(msg: 'Mechanic lis is :${mechanicList.last}');
              Fluttertoast.showToast(msg: 'Mechanic lis is :${mechanicList.length}');

            }
            _markers = Iterable.generate(mechanicList.length, (index) {
              return Marker(
                markerId: MarkerId(mechanicList[index].uid),
                position: LatLng(
                  list[index].lati,
                  list[index].longi,
                ),
                infoWindow: InfoWindow(
                    title: "${mechanicList[index].businessType}  (${mechanicList[index].name})",
                    snippet: mechanicList[index].mobileNo,
                    onTap: (){
                      FlutterPhoneDirectCaller.callNumber(mechanicList[index].mobileNo);
                    }
                ),
              );
            });
            markers=_markers;
            Fluttertoast.showToast(msg: 'Sublist is : ${mechanicList.length}');
            print('mechanic List is : ${mechanicList.length}');
            return ListView.builder(
                shrinkWrap: true,
                itemCount: mechanicList.length,
                itemBuilder:(context,index){
                  Fluttertoast.showToast(msg: 'Sublist is : ${mechanicList.length}');
                  print('mechanic List is : ${mechanicList.length}');
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        GoogleMap(
                          initialCameraPosition: const CameraPosition(target: _initialcameraposition),
                          mapType: MapType.normal,
                          zoomControlsEnabled: true,
                          zoomGesturesEnabled: true,
                          onMapCreated: _onMapCreated,
                          myLocationEnabled: true,
                          markers : Set.from(markers),
                          scrollGesturesEnabled: true,
                          rotateGesturesEnabled: true,
                          myLocationButtonEnabled: true,
                        ),

                      ],
                    ),
                  );


                }
            );



          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }


        },
      ),
    );

  }
}