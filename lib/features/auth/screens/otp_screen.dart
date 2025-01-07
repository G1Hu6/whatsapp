import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/common/utils/utils.dart';
import 'package:whatsapp_ui/common/widgets/styled_button.dart';
import 'package:whatsapp_ui/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_ui/features/auth/widgets/auth_otp_field.dart';

class OtpScreen extends ConsumerStatefulWidget {
  static const routeName = 'otp-screen';

  final String? phoneNumber;
  const OtpScreen({super.key, this.phoneNumber});

  @override
  ConsumerState<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends ConsumerState<OtpScreen> {
  final otpController = TextEditingController();

  void validatePhoneUsingOtp() {
    if (otpController.text.length == 6 &&
        otpController.text.trim().isNotEmpty) {
      ref.read(authControllerProvider).verifyPhoneNumberWithOtp(
          "+917709286790", otpController.text, context);
    } else {
      showAlertDialog(context: context, message: "Please enter a valid OTP");
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
              "Verifing your number",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text:
                    'Waiting to automatically detect an SMS sent to ${widget.phoneNumber}.',
                style: const TextStyle(fontSize: 14, color: Colors.white),
                children: <TextSpan>[
                  TextSpan(
                      text: 'Wrong number?',
                      style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.15, vertical: 20),
                child: AuthOtpField(
                    hintText: "_ _ _ _ _ _", controller: otpController)),
            StyledButton(
                text: "Ok",
                onPressed: () {
                  validatePhoneUsingOtp();
                })
          ],
        ),
      ),
    ));
  }
}
