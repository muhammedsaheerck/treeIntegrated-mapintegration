import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';
import 'package:treetech/pressentation/core/core.dart';

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
        // backgroundColor: Colors.amber,
        appBar: AppBar(
          leading: const Text("17mins"),
          title: const Text("1.8 km"),
          actions: const [Text("11:48 am")],
        ),
        body:
            //  Stack(
            //   children: [
            //     SizedBox(
            //       height: 400,
            //       width: double.infinity,
            //       child: GoogleMap(
            //         initialCameraPosition: _kGoogle,
            //         zoomControlsEnabled: false,
            //         mapType: MapType.normal,
            //         compassEnabled: true,
            //         trafficEnabled: true,
            //         onMapCreated: (GoogleMapController controller) async {
            //           await getUserCurrentLocation();
            //         },
            //       ),
            //     ),
            //     SingleChildScrollView(
            //       child: Padding(
            //         padding: const EdgeInsets.only(top: 300),
            //         child: Container(
            //           decoration: BoxDecoration(
            //             color: Colors.green,
            //             borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50))
            //           ),
            //           height: 700,
            //         ),
            //       ),
            //     )
            //   ],
            // ),
            SlidingUpPanel(
          isDraggable: true,
          panel: Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 170, right: 170),
                  child: Divider(
                    thickness: 4,
                    color: Colors.black,
                  ),
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.place,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "DELIVERY LOCATION",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Text("#ODN000598"),
                  ],
                ),
                hight10,
                ListTile(
                  leading: Container(
                      width: 100,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40)),
                      // width: 100,
                      child: Image.asset(
                        "asset/46310737_2102978689754530_2050410506572791808_n.jpg",
                        fit: BoxFit.cover,
                        // width: 100,
                        // height: 100,
                      )),
                  title: const Text(
                    "Vattakarai,Chennavannavilai\nNagarcoil,Tamil Nadu 629002,india",
                    style: TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                ),
                hight10,
                divider1,
                ListTile(
                  leading: Column(
                    children: [
                      Text(
                        "Payment",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      hight10,
                      const Text("₹ 1253",
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                  title: Column(
                    children: [
                      Text(
                        "Payment Mode",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      hight10,
                      const Text("Cash on delivery",
                          style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                divider1,
                hight10,
                Padding(
                  padding: const EdgeInsets.only(right: 280),
                  child: Text(
                    "Delivering to",
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ),
                hight10,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: CircleAvatar(
                          radius: 15,
                          child: Image.asset(
                            "asset/man.png",
                            width: 20,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Flexible(
                          flex: 1,
                          child: Text(
                            "Anita",
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 6,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            CircleAvatar(
                                radius: 15,
                                child: Icon(
                                  Icons.message,
                                  size: 20,
                                )),
                            SizedBox(
                              width: 20,
                            ),
                            CircleAvatar(
                                radius: 15,
                                child: Icon(
                                  Icons.call,
                                  size: 20,
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SwipeableButtonView(onFinish: (){}, onWaitingProcess: (){}, activeColor: Colors.blue, buttonWidget: Container(), buttonText: "buttonText")
              ],
            ),
          )),
          body: Center(
            child: GoogleMap(
              initialCameraPosition: _kGoogle,
              zoomControlsEnabled: false,
              mapType: MapType.hybrid,
              compassEnabled: true,
              trafficEnabled: true,
              onMapCreated: (GoogleMapController controller) async {
                await getUserCurrentLocation();
              },
            ),
          ),
        ));
  }
}
