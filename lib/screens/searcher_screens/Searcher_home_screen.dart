import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:worker/models/user_model.dart';
import 'package:worker/models/worker_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';

class UsersOnMap extends StatefulWidget {
  String machinacType="";

  UsersOnMap({Key? key, required this.machinacType}) : super(key: key);
  @override
  State<UsersOnMap> createState() => _UsersOnMapState(machinacType);
}
class _UsersOnMapState extends State<UsersOnMap> {
  String machinacType;
  _UsersOnMapState(this.machinacType);
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  final LatLng _initialcameraposition = const LatLng(20.5937, 78.9629);
  late GoogleMapController _controller;
  final Location _location = Location();
  String address = "";
  Iterable markers = [];
  late Iterable _markers;

  @override
  void initState() {
    setState(() {

    });
    super.initState();
  }
  void _onMapCreated(GoogleMapController cntlr)
  {
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
  var searchUser=<UserModel>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').snapshots(),
        builder:(context, AsyncSnapshot<QuerySnapshot>  snapshot){
          Fluttertoast.showToast(msg: machinacType);
          var list = <WorkerModel>[];
          if(snapshot.hasData && !snapshot.hasError){
            for (var i = 0; i < snapshot.data!.docs.length; i++) {
              var newData=snapshot.data!.docs[i];
              var location = newData['location'];
              List<String> dateParts = location.split(",");
              double latitude  = double.parse(dateParts[0]);
              double longitude=double.parse(dateParts[1]);
              if(newData['businessType'].toString().compareTo(machinacType)==0){
                WorkerModel userModel=WorkerModel(uid: newData['uid'], name: newData['name'],
                    businessType: newData['businessType'],
                    email: newData['email'], mobileNo: newData['mobileNo'],
                    address: newData['address'],
                    lati: latitude, longi:longitude , password: newData['password'],
                    confrimPassword: "");
                list.add(userModel);
              }else{

              }

            }
            _markers = Iterable.generate(list.length, (index) {
              return Marker(
                  markerId: MarkerId(list[index].uid),
                  position: LatLng(
                    list[index].lati,
                    list[index].longi,
                  ),
                    infoWindow: InfoWindow(
                    title: "${list[index].businessType}  (${list[index].name})",
                    snippet: list[index].mobileNo,
                    onTap: (){
                      FlutterPhoneDirectCaller.callNumber(list[index].mobileNo);

                    }
                  ),
              );
            });
            markers = _markers;
            return ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder:(context,index){
                    return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        GoogleMap(
                          initialCameraPosition: CameraPosition(target: _initialcameraposition),
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
          } else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

        },
      ),
      // Container(
      //   height: MediaQuery.of(context).size.height,
      //   width: MediaQuery.of(context).size.width,
      //   child: Stack(
      //     children: [
      //       GoogleMap(
      //         onTap: (LatLng latLng) async{
      //           var latitude = latLng.latitude;
      //           var longitude = latLng.longitude;
      //            Fluttertoast.showToast(msg: longitude.toString());
      //           var locationtxt = "$latitude,$longitude";
      //           //_sendDataBack(context,locationtxt);
      //         },
      //         initialCameraPosition: CameraPosition(target: _initialcameraposition),
      //         mapType: MapType.normal,
      //         onMapCreated: _onMapCreated,
      //         myLocationEnabled: true,
      //       ),
      //
      //     ],
      //   ),
      // ),



    );
  }
}

