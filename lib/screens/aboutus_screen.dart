import 'package:flutter/material.dart';
import 'package:smart_waste_mobile/utlis/colors.dart';
import 'package:smart_waste_mobile/widgets/drawer_widget.dart';

import '../widgets/text_widget.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      endDrawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Stack(
          children: [
            Column(
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
                    Image.asset(
                      'assets/images/LOGO 1.png',
                      height: 50,
                    ),
                    TextWidget(
                      text: 'Smart Solid\nWaste Collector',
                      fontSize: 18,
                      color: Colors.white,
                      fontFamily: 'Bold',
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
                  height: 50,
                ),
                Stack(
                  children: [
                    Container(
                      height: 400,
                      width: 500,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextWidget(
                              text: 'About Us',
                              fontSize: 24,
                              fontFamily: 'Bold',
                              color: Colors.black,
                            ),
                            const SizedBox(
                              height: 75,
                            ),
                            TextWidget(
                              align: TextAlign.start,
                              text: '''
Welcome to Smart Solid Waste Collector! We are a team dedicated to transforming waste management through our IoT-based mobile app with a real-time location tracking system. Committed to environmental sustainability, our user-friendly solution empowers individuals, communities, and businesses to manage waste efficiently while staying connected to the live status of waste collection. Join us on the journey towards a cleaner, smarter, and more sustainable future as we work together to make a positive impact on our shared planet.
''',
                              fontSize: 12,
                              fontFamily: 'Medium',
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 75, right: 20),
              child: Align(
                alignment: Alignment.topRight,
                child: Image.asset(
                  'assets/images/new-removebg-preview.png',
                  height: 150,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
