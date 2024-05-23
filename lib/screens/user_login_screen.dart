import 'package:flutter/material.dart';
import 'package:smart_waste_mobile/utlis/colors.dart';
import 'package:smart_waste_mobile/widgets/button_widget.dart';
import 'package:smart_waste_mobile/widgets/text_widget.dart';
import 'package:smart_waste_mobile/widgets/textfield_widget.dart';

class UserLoginScreen extends StatefulWidget {
  const UserLoginScreen({super.key});

  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Image.asset(
                'assets/images/text.png',
                width: 250,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 150,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget(
                    text: 'Hello!',
                    fontSize: 32,
                    fontFamily: 'Bold',
                  ),
                  TextWidget(
                    text: 'Login your account',
                    fontSize: 18,
                    fontFamily: 'Medium',
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: TextFieldWidget(
                borderColor: primary,
                controller: email,
                label: 'Email',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: TextFieldWidget(
                borderColor: primary,
                controller: password,
                label: 'Password',
                isObscure: true,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Center(
              child: ButtonWidget(
                radius: 100,
                width: 300,
                color: primary,
                label: 'Login',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
