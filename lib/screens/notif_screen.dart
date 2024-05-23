import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_waste_mobile/utlis/colors.dart';
import 'package:smart_waste_mobile/widgets/drawer_widget.dart';
import 'package:smart_waste_mobile/widgets/text_widget.dart';

class NotifScreen extends StatelessWidget {
  const NotifScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const DrawerWidget(),
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
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
                  const SizedBox(
                    width: 50,
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
              Container(
                width: 350,
                height: 400,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    TextWidget(
                      text: 'Notifications',
                      fontSize: 14,
                      color: Colors.black,
                      fontFamily: 'Bold',
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('Announcements')
                            .orderBy('postedAt', descending: true)
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasError) {
                            print(snapshot.error);
                            return const Center(child: Text('Error'));
                          }
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Padding(
                              padding: EdgeInsets.only(top: 50),
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }

                          final data = snapshot.requireData;
                          return SizedBox(
                            height: 370,
                            child: ListView.builder(
                              itemCount: data.docs.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: const Icon(Icons.notifications),
                                  title: TextWidget(
                                      text:
                                          '${data.docs[index]['announcement']} ${DateFormat.yMMMd().add_jm().format(data.docs[index]['postedAt'].toDate())}',
                                      fontSize: 14),
                                );
                              },
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
