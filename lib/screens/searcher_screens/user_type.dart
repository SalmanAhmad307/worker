
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:worker/models/worker_model_send.dart';
import 'package:location/location.dart';
import 'package:worker/screens/searcher_screens/types.dart';

import 'Searcher_home_screen.dart';
class BusinessType extends StatefulWidget {
  const BusinessType({Key? key}) : super(key: key);

  @override
  State<BusinessType> createState() => _BusinessTypeState();
}

class _BusinessTypeState extends State<BusinessType> {
  final Location _location=Location();
  final List<String> machinacType=[
    'Mechanic',
    'plumber',
    'Electron',
    'Auto Mechanic',
    'car Mechanic',
    'painter',
    'Elctration'
    'car Painter',
    'Auto body mechanics',
    'Race car mechanics',
    'Service technicians',
  ];
  @override
  Widget build(BuildContext context) {
    FirebaseAuth firebaseAuth=FirebaseAuth.instance;
    FirebaseFirestore fireStore=FirebaseFirestore.instance;
    CollectionReference users=fireStore.collection('users');
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title:const Text(
            'Business Type',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 15,
          ),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: ListView.builder(
          itemCount: machinacType.length,
            itemBuilder: (context , index)
            {

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (ctx){
                    return UsersOnMap(machinacType:machinacType[index].toString());
                  }));
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 13),
                              child: Text(
                                machinacType[index],
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,
                                ),
                              ),
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
            }

        )
      ),
    );
  }
  // void getMechanicType(){
  //   FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  //   const LatLng _initialcameraposition = LatLng(20.5937, 78.9629);
  //   late GoogleMapController _controller;
  //   //final Location _location = Location();
  //
  //   String address = "";
  //   Iterable markers = [];
  //   late Iterable _markers;
  //   List mechanicList=<MechanicModel>[];
  //   void _onMapCreated(GoogleMapController cntlr) {
  //     _controller = cntlr;
  //     _location.onLocationChanged.listen((l) {
  //       _controller.animateCamera(
  //         CameraUpdate.newCameraPosition(
  //           CameraPosition(target: LatLng(l.latitude!, l.longitude!),zoom: 15),
  //         ),
  //       );
  //
  //     }
  //     );
  //   }
  //   StreamBuilder(
  //     stream:FirebaseFirestore.instance.collection('users').snapshots() ,
  //     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
  //       if(snapshot.hasData && !snapshot.hasError){
  //         for (var i = 0; i < snapshot.data!.docs.length; i++) {
  //           var mechanicData=snapshot.data!.docs[i];
  //           var businessType = mechanicData['businessType'];
  //           MechanicModel mechanicModel=
  //           MechanicModel(
  //               uid:mechanicData['uid'],
  //               name: mechanicData['name'],
  //               businessType: mechanicData['businessType'],
  //               email: mechanicData['email'],
  //               mobileNo: mechanicData['mobileNo'],
  //               address: mechanicData['address'],
  //               lati: mechanicData['lati'],
  //               longi: mechanicData['longi'],
  //               password: mechanicData['password'],
  //               confrimPassword: mechanicData['confrimPassword'],
  //           );
  //           mechanicList.add(mechanicModel);
  //
  //         }
  //         _markers = Iterable.generate(mechanicList.length, (index) {
  //           return Marker(
  //             markerId: MarkerId(mechanicList[index].uid),
  //             position: LatLng(
  //               mechanicList[index].lati,
  //               mechanicList[index].longi,
  //             ),
  //             infoWindow: InfoWindow(
  //                 title: "${mechanicList[index].businessType}  (${mechanicList[index].name})",
  //                 snippet: mechanicList[index].mobileNo,
  //                 onTap: (){
  //                   FlutterPhoneDirectCaller.callNumber(mechanicList[index].mobileNo);
  //
  //                 }
  //             ),
  //           );
  //         });
  //        markers=_markers;
  //         return ListView.builder(
  //             shrinkWrap: true,
  //             itemCount: 1,
  //             itemBuilder:(context,index){
  //               Fluttertoast.showToast(msg: 'Sublist is : ${mechanicList.sublist(1)}');
  //               return SizedBox(
  //                 height: MediaQuery.of(context).size.height,
  //                 width: MediaQuery.of(context).size.width,
  //                 child: Stack(
  //                   children: [
  //                     GoogleMap(
  //                       initialCameraPosition: CameraPosition(target: _initialcameraposition),
  //                       mapType: MapType.normal,
  //                       zoomControlsEnabled: true,
  //                       zoomGesturesEnabled: true,
  //                       onMapCreated: _onMapCreated,
  //                       myLocationEnabled: true,
  //                       markers : Set.from(markers),
  //                       scrollGesturesEnabled: true,
  //                       rotateGesturesEnabled: true,
  //                       myLocationButtonEnabled: true,
  //                     ),
  //
  //                   ],
  //                 ),
  //               );
  //
  //
  //             }
  //         );
  //
  //
  //
  //       }else{
  //         return const Center(
  //           child: CircularProgressIndicator(),
  //         );
  //       }
  //
  //
  //     },
  //   );
  // }
}


