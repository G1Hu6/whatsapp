import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/common/widgets/styled_button.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "login-screen";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Enter your phone number",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: '''WhatsApp will need to verify your phone 
                  number. Carrier changes may apply. ''',
                style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                children: const <TextSpan>[
                  TextSpan(
                      text: 'What\'s my number?',
                      style: TextStyle(color: primaryColor)),
                ],
              ),
            ),
            const TextField(
              cursorColor: primaryColor,
              decoration: InputDecoration(
                  hintText: "Choose a country",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 15,
                    color: Colors.white,
                  ),
                  contentPadding: EdgeInsets.only(bottom: 1),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 2)),
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor)),
                  disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primaryColor))),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                        hintText: "Choose a country",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                        contentPadding: EdgeInsets.only(bottom: 1),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: primaryColor, width: 2)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor)),
                        disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor))),
                  ),
                ),
                Expanded(
                  child: TextField(
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                        hintText: "Choose a country",
                        hintStyle: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15,
                          color: Colors.white,
                        ),
                        contentPadding: EdgeInsets.only(bottom: 1),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor)),
                        focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: primaryColor, width: 2)),
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor)),
                        disabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor))),
                  ),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: StyledButton(text: "Next", onPressed: () {}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
