/*
import 'dart:ui';
import 'package:google_maps_flutter/google_maps_flutter.dart';
//import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
//import 'package:custom_info_window/custom_info_window.dart';

//import 'package:geolocator/geolocator.dart';
void main(){
  runApp(maplocation());
}
class maplocation extends StatelessWidget {
  const maplocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
   title: Text('MAP'),
 ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Google Map Demo',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>googlemap()));
        },
        tooltip: 'Google Map',
        child: Icon(Icons.pin_drop_outlined),
      ),
    );
  }
}

class googlemap extends StatefulWidget {
  const googlemap({Key? key}) : super(key: key);

  @override
  _googlemapState createState() => _googlemapState();
}

class _googlemapState extends State<googlemap> {
Set <Marker>_markers={};

void _onmapCreated(GoogleMapController controller){
setState(() {
  _markers.add(
    Marker(markerId:MarkerId('id_1'),position:LatLng(31.5074757, 74.4422475),
infoWindow: InfoWindow(
    title:'phase 8',
        snippet:'lahore'
  ),
    ),
  );
});
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Google Map'),),
      body: Center(
        child: GoogleMap(
onMapCreated: _onmapCreated ,

markers:_markers,
          initialCameraPosition: CameraPosition(
                  target: LatLng(31.5074757, 74.4422475), zoom: 15),
            ),
      ),
    );
  }
}


*/


import 'dart:async';

import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//import 'package:google_geocoding/google_geocoding.dart';
import 'package:geocoding/geocoding.dart';
class maplocation extends StatefulWidget {
  const maplocation({Key? key}) : super(key: key);

  @override
  _maplocationState createState() => _maplocationState();
}

class _maplocationState extends State<maplocation> {

  Completer<GoogleMapController> _controller = Completer();
  String Address = 'search';

 double latitude = 0;
  double longitude = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // _getGeoLocationPosition();

    getPosition();
  }
  //String location ='Null, Press Button';

  late Position position;

  Future<void> getPosition() async {
    Position position = await _getGeoLocationPosition();

    setState(() {
      this.position = position;
      /*GetAddressFromLatLong(position);
     latitude= position.latitude;
      longitude=position.longitude;
     print("my position");
     print(position.latitude);
     print(position.longitude);*/
    });

  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }


  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }
 /* Future<void> GetAddressFromLatLong(Position position)async {
    List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address = '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    setState(()  {

    });
  }*/


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: GoogleMap(

          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(

              target: LatLng(this.position.latitude, this.position.longitude), zoom: 15),),

      ),
    );
  }
}
