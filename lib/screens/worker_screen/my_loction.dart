
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final LatLng _initialcameraposition = const LatLng(20.5937, 78.9629);
  late GoogleMapController _controller;
  final Location _location = Location();
  String address = "";

  void _onMapCreated(GoogleMapController _cntlr)
  {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) {
      _controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(l.latitude!!, l.longitude!!),zoom: 15),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            GoogleMap(
              onTap: (LatLng latLng) async{
                var latitude = latLng.latitude;
                var longitude = latLng.longitude;
                // Fluttertoast.showToast(msg: longitude.toString()!!);
                var locationtxt = "$latitude,$longitude";
                _sendDataBack(context,locationtxt);
              },
              initialCameraPosition: CameraPosition(target: _initialcameraposition),
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,
              myLocationEnabled: true,
            ),

          ],
        ),
      ),
    );
  }
  void _sendDataBack(BuildContext context,var locationtxt) {
    Navigator.pop(context, locationtxt);
  }

}