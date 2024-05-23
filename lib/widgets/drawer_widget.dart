import 'package:flutter/material.dart';
import 'package:smart_waste_mobile/screens/aboutus_screen.dart';
import 'package:smart_waste_mobile/screens/announcement_screen.dart';
import 'package:smart_waste_mobile/screens/feedback_screen.dart';
import 'package:smart_waste_mobile/screens/notif_screen.dart';
import 'package:smart_waste_mobile/widgets/text_widget.dart';

import '../screens/home_screen.dart';
import '../utlis/colors.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 250,
      color: background,
      child: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.white,
            ),
            const SizedBox(
              height: 10,
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const HomeScreen()));
              },
              title: TextWidget(
                text: 'Dashboard',
                fontSize: 14,
                fontFamily: 'Bold',
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.notifications,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const NotifScreen()));
              },
              title: TextWidget(
                text: 'Notifications',
                fontSize: 14,
                fontFamily: 'Bold',
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.info,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const AboutUsScreen()));
              },
              title: TextWidget(
                text: 'About Us',
                fontSize: 14,
                fontFamily: 'Bold',
                color: Colors.white,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.feedback,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const FeedbackScreen()));
              },
              title: TextWidget(
                text: 'Feedback',
                fontSize: 14,
                fontFamily: 'Bold',
                color: Colors.white,
              ),
            ),
          ],
        ),
      )),
    );
  }
}
