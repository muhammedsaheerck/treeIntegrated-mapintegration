import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:treetech/pressentation/screen_order/screen_offline.dart';
import 'package:treetech/pressentation/screen_order/screen_online.dart';

class ScreenOrders extends StatefulWidget {
  ScreenOrders({super.key});

  @override
  State<ScreenOrders> createState() => _ScreenOrdersState();
}

class _ScreenOrdersState extends State<ScreenOrders>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 19,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                    radius: 17,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundColor: Colors.grey.shade400,
                      radius: 15,
                      child: Image.asset(
                        "asset/man.png",
                        width: 20,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              trailing: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.android,
                  color: Colors.red,
                  size: 30,
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Container(
                  width: 300,
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(40)),
                  child: TabBar(
                      unselectedLabelColor: Colors.grey.shade400,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue.shade700,
                      ),
                      controller: _tabController,
                      labelPadding: const EdgeInsets.only(top: 5, bottom: 5),
                      indicatorColor: Colors.blue.shade700,
                      labelStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w400),
                      tabs: const [
                        Text(
                          "Online",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text("Offline", style: TextStyle(color: Colors.black))
                      ]),
                ),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: const [ScreenOnline(), ScreenOffline()]),
            ),
          ],
        ),
      ),
    );
  }
}
