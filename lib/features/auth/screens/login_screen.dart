import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/common/utils/utils.dart';
import 'package:whatsapp_ui/common/widgets/styled_button.dart';
import 'package:whatsapp_ui/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_ui/features/auth/widgets/auth_text_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const routeName = "login-screen";
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final countryController = TextEditingController();
  final countryCodeController = TextEditingController();
  final phoneNumberController = TextEditingController();
  Country pickedCountry = Country.worldWide;

  void showAllCountryPicker() {
    showCountryPicker(
      context: context,

      showPhoneCode:
          true, // optional. Shows phone code before the country name.
      onSelect: (Country country) {
        setState(() {
          pickedCountry = country;
        });
      },
    );
  }

  void sendPnoneNumber() {
    String phoneNumber = phoneNumberController.text.trim();
    if (pickedCountry != Country.worldWide && phoneNumber.isNotEmpty) {
      ref.read(authControllerProvider).signInWithPnoneNumber(
          "+${pickedCountry.phoneCode}$phoneNumber", context);
    } else {
      showAlertDialog(context: context, message: "Please Submit all fields");
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: size.height * 0.1),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
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
                text: const TextSpan(
                  text: '''WhatsApp will need to verify your phone 
number. Carrier changes may apply. ''',
                  style: TextStyle(fontSize: 14, color: Colors.white),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'What\'s my number?',
                        style: TextStyle(color: primaryColor)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.15, vertical: 20),
                child: Column(
                  children: [
                    AuthTextField(
                        onTap: showAllCountryPicker,
                        hintText: (pickedCountry != Country.worldWide)
                            ? pickedCountry.name
                            : "Choose a country",
                        hintColor: Colors.white,
                        readOnly: true,
                        controller: countryController),
                    Row(
                      children: [
                        SizedBox(
                            width: size.width * 0.15,
                            child: AuthTextField(
                              readOnly: true,
                              hintText: "+ ${pickedCountry.phoneCode}",
                              controller: countryCodeController,
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                            child: AuthTextField(
                                hintText: "Phone Number",
                                controller: phoneNumberController))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: StyledButton(
        text: "Next",
        onPressed: sendPnoneNumber,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
