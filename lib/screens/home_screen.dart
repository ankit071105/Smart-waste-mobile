import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:smart_waste_mobile/screens/announcement_screen.dart';
import 'package:smart_waste_mobile/screens/notif_screen.dart';
import 'package:smart_waste_mobile/utlis/colors.dart';
import 'package:smart_waste_mobile/widgets/button_widget.dart';
import 'package:smart_waste_mobile/widgets/drawer_widget.dart';
import 'package:smart_waste_mobile/widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const DrawerWidget(),
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const AnnouncementScreen()));
                  },
                  icon: const Icon(
                    Icons.campaign_outlined,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: 'Smart Solid\nWaste Collector',
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: 'Bold',
                    ),
                    Image.asset(
                      'assets/images/image-removebg-preview (7) 1.png',
                      height: 125,
                    ),
                    TextWidget(
                      text: 'Garbage Truck Tracker',
                      fontSize: 14,
                      color: Colors.white,
                      fontFamily: 'Bold',
                    ),
                  ],
                ),
                Builder(builder: (context) {
                  return IconButton(
                    onPressed: () async {
                      Scaffold.of(context).openEndDrawer();
                    },
                    icon: const Icon(
                      Icons.menu,
                      color: Colors.white,
                    ),
                  );
                }),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      color: Colors.blue,
                    ),
                    TextWidget(
                      text: 'Routes',
                      fontSize: 14,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      color: Colors.green,
                    ),
                    TextWidget(
                      text: 'Drop point',
                      fontSize: 14,
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 25,
                      height: 25,
                      color: Colors.red,
                    ),
                    TextWidget(
                      text: 'Missed',
                      fontSize: 14,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            StreamBuilder<DatabaseEvent>(
                stream: FirebaseDatabase.instance.ref().onValue,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    print(snapshot.error);
                    return const Center(child: Text('Error'));
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Padding(
                      padding: EdgeInsets.only(top: 50),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.black,
                        ),
                      ),
                    );
                  }
                  final dynamic data = snapshot.data!.snapshot.value;

                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 400,
                    height: 250,
                    child: GoogleMap(
                      markers: {
                        Marker(
                          position: LatLng(
                              double.parse(
                                  data['NODES']['Truck-01']['latitude']),
                              double.parse(
                                  data['NODES']['Truck-01']['longitude'])),
                          markerId: MarkerId(
                            data['NODES']['Truck-01']['timestamp'].toString(),
                          ),
                        ),
                      },
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                            double.parse(data['NODES']['Truck-01']['latitude']),
                            double.parse(
                                data['NODES']['Truck-01']['longitude'])),
                        zoom: 14.4746,
                      ),
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                      },
                    ),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              radius: 15,
              color: Colors.green,
              label: 'Track GT',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
