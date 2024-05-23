import 'package:flutter/material.dart';
import 'package:smart_waste_mobile/utlis/colors.dart';
import 'package:smart_waste_mobile/widgets/button_widget.dart';
import 'package:smart_waste_mobile/widgets/drawer_widget.dart';
import 'package:smart_waste_mobile/widgets/textfield_widget.dart';

import '../widgets/text_widget.dart';
import 'home_screen.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final messageController = TextEditingController();

  bool ischecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      endDrawer: const DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextWidget(
                        text: 'How may I help you?',
                        fontSize: 18,
                        fontFamily: 'Bold',
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextWidget(
                        text: 'how to use the app?',
                        fontSize: 14,
                        fontFamily: 'Bold',
                        color: Colors.white,
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/new-removebg-preview.png',
                    height: 100,
                  ),
                ],
              ),
              const Divider(
                color: Colors.white,
              ),
              const SizedBox(
                height: 20,
              ),
              TextWidget(
                text: 'Give us a Feedback',
                fontSize: 18,
                fontFamily: 'Bold',
                color: Colors.white,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                borderColor: Colors.black,
                width: 500,
                controller: nameController,
                label: 'Name',
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                borderColor: Colors.black,
                width: 500,
                controller: emailController,
                label: 'Email',
              ),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget(
                borderColor: Colors.black,
                width: 500,
                controller: messageController,
                label: 'Message',
                maxLine: 10,
                height: 150,
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        ischecked = !ischecked;
                      });
                    },
                    icon: Icon(
                      ischecked
                          ? Icons.check_box
                          : Icons.check_box_outline_blank_rounded,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TextWidget(
                    text: 'I accept the Terms and Service',
                    fontSize: 12,
                    fontFamily: 'Bold',
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Center(
                child: ButtonWidget(
                  radius: 15,
                  color: primary,
                  label: 'Submit',
                  onPressed: () {
                    showSubmittedDialog();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showSubmittedDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/new-removebg-preview.png',
                  height: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextWidget(
                  text: 'SUBMITTED!',
                  fontSize: 24,
                  color: Colors.black,
                  fontFamily: 'Bold',
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 30),
                  child: ButtonWidget(
                    radius: 15,
                    color: primary,
                    label: 'Back to Dashboard',
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
