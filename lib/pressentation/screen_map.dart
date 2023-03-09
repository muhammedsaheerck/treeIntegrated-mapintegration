import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:slide_to_act/slide_to_act.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:treetech/pressentation/core/core.dart';

class ScreenMap extends StatelessWidget {
  const ScreenMap({super.key});
  static const CameraPosition _kGoogle = CameraPosition(
    target: LatLng(10.1632, 76.6413),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.amber,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          title: const Text(
            "17mins",
            style: TextStyle(color: Colors.black, fontSize: 16),
          ),
          actions: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "1.8 km",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            width10,
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "11:48 am",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ),
            width10
          ],
        ),
        body: SlidingUpPanel(
          isDraggable: true,
          panel: Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Divider(
                  height: 2,
                  indent: 150,
                  endIndent: 150,
                  thickness: 4,
                  color: Colors.grey.shade700,
                ),
                hight10,
                Row(
                  children: const [
                    Icon(
                      Icons.place,
                      color: Colors.blue,
                      size: 16,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "DELIVERY LOCATION",
                      style: TextStyle(color: Colors.blue, fontSize: 14),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      "#ODN000598",
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                hight10,
                ListTile(
                  leading: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                                "asset/46310737_2102978689754530_2050410506572791808_n.jpg")),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  title: const Text(
                    "Vattakarai,Chennavannavilai\nNagarcoil,Tamil Nadu 629002,india",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
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
                        style: TextStyle(
                            color: Colors.grey.shade700, fontSize: 15),
                      ),
                      hight10,
                      const Text("Cash on delivery",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15))
                    ],
                  ),
                ),
                divider1,
                Padding(
                  padding: const EdgeInsets.only(right: 255),
                  child: Text(
                    "Delivering to",
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ),
                hight10,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Wrap(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 14,
                            child: Image.asset(
                              "asset/man.png",
                              width: 17,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "Anita",
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          CircleAvatar(
                              radius: 14,
                              child: Icon(
                                Icons.message,
                                size: 17,
                              )),
                          SizedBox(
                            width: 20,
                          ),
                          CircleAvatar(
                              radius: 14,
                              child: Icon(
                                Icons.call,
                                size: 17,
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
                hight10,
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SlideAction(
                    elevation: 2,
                    borderRadius: 10,
                    sliderButtonIcon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.blue,
                    ),
                    height: 40,
                    sliderButtonIconPadding: 4,
                    text: "Order Completed",
                    textStyle: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 90,
                ),
                const Divider(
                  height: 0,
                  thickness: 1,
                ),
                const ListTile(
                  leading: CircleAvatar(
                      radius: 14,
                      child: Icon(
                        Icons.warning,
                        size: 17,
                      )),
                  title: Text(
                    "Report Issues about this order",
                    style: TextStyle(color: Colors.blue, fontSize: 14),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.blue,
                  ),
                ),
                const Divider(
                  height: 0,
                  thickness: 1,
                )
              ],
            ),
          )),
          body: const Center(
            child: GoogleMap(
              initialCameraPosition: _kGoogle,
              zoomControlsEnabled: false,
              mapType: MapType.normal,
              compassEnabled: true,
              trafficEnabled: true,
            ),
          ),
        ));
  }
}
