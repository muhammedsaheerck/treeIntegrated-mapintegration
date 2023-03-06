import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class ScreenMap extends StatelessWidget {
  ScreenMap({super.key});
  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(10.1632, 76.6413),
    zoom: 14.4746,
  );

// created method for getting user current product
  Future getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
    });
    return await Geolocator.getCurrentPosition();
  }

  Completer<GoogleMapController> controllers = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        leading: const Text("17mins"),
        title: const Text("1.8 km"),
        actions: const [Text("11:48 am")],
      ),
      body: Stack(
        children: [
          SizedBox(
            height: 400,
            width: double.infinity,
            child: GoogleMap(
              initialCameraPosition: _kGoogle,
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              compassEnabled: true,
              trafficEnabled: true,
              onMapCreated: (GoogleMapController controller) async {
                await getUserCurrentLocation();
              },
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 300),
              child: Container(
                height: 700,
                color: Colors.green,
              ),
            ),
          )
        ],
      ),
    );
  }
}
