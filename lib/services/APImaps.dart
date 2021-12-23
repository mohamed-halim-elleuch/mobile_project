
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {

  Completer<GoogleMapController> _controller = Completer();
  late Position currentPosition = Position(longitude: 0, latitude: 0, timestamp: null, accuracy: 0, altitude: 0, heading: 0, speed: 0, speedAccuracy: 0);
  getCurrentLocation() {
    Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
        forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        currentPosition = position;

      });
      print(position);
    }).catchError((e) {
      print(e);
    });
  }
  late CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(currentPosition.latitude, currentPosition.longitude),
    zoom: 10,
  );
  late CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(currentPosition.latitude, currentPosition.longitude),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();
    print(currentPosition);



    //_getCurrentLocation();
    //getWeather('London');
  }

  @override
  Widget build(BuildContext context) {
    Map<MarkerId, Marker> markers = <MarkerId, Marker>{MarkerId('marker_id_1'):Marker(
      markerId: MarkerId('Your position '),
      position: LatLng(currentPosition.latitude, currentPosition.longitude),
      infoWindow: InfoWindow(title: 'Your position'),
      onTap: () {
        print('Marker Tapped');
      },
      onDragEnd: (LatLng position) {
        print('Drag Ended');
      },  )};
    return new Scaffold(
      body:
      currentPosition.latitude ==0 ? Center(child:CircularProgressIndicator(color: Colors.black,)):
      GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: Set<Marker>.of(markers.values),

      ),

    );
  }
}
