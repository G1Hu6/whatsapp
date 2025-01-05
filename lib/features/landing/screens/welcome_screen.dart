import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/common/widgets/styled_button.dart';
import 'package:whatsapp_ui/features/auth/screens/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void navigateToLoginScreen(BuildContext context) {
    Navigator.of(context).pushNamed(LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Image.asset(
                color: primaryColor,
                width: 300,
                "assets/images/welcome-banner.png"),
            SizedBox(
              height: size.height * 0.05,
            ),
            const Text(
              "Welcome to WhatsApp",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Center(
                child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Read our ',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                children: const <TextSpan>[
                  TextSpan(
                      text: 'Privacy Policy',
                      style: TextStyle(color: Colors.blue)),
                  TextSpan(
                    text: '. Tap "Agree and continue" to accept the',
                  ),
                  TextSpan(
                      text: ' Terms of Service',
                      style: TextStyle(color: Colors.blue)),
                ],
              ),
            )),
            SizedBox(
              height: size.height * 0.02,
            ),
            TextButton.icon(
                style: const ButtonStyle(
                    overlayColor: WidgetStatePropertyAll(Colors.black),
                    minimumSize: WidgetStatePropertyAll(Size(100, 40)),
                    iconColor: WidgetStatePropertyAll(primaryColor)),
                onPressed: () {},
                icon: const Icon(Icons.language),
                label: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "English ",
                      style: TextStyle(fontSize: 14, color: primaryColor),
                    ),
                    Icon(Icons.arrow_drop_down)
                  ],
                )),
            Flexible(
              flex: 2,
              child: Container(),
            ),
            StyledButton(
                text: "Agree and continue",
                onPressed: () {
                  navigateToLoginScreen(context);
                })
          ],
        ),
      ),
    );
  }
}
