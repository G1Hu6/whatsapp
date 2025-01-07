import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:whatsapp_ui/common/utils/utils.dart';
import 'package:whatsapp_ui/features/auth/screens/otp_screen.dart';

final authRepositoryProvider = Provider((ref) {
  return AuthRepository(supabaseAuth: Supabase.instance.client.auth);
});

class AuthRepository {
  final GoTrueClient supabaseAuth;

  AuthRepository({required this.supabaseAuth});

  Future<void> signInWithPnoneNumber(
      String phoneNumber, BuildContext context) async {
    try {
      await supabaseAuth
          .signInWithOtp(
        phone: phoneNumber,
      )
          .then(
        (value) {
          Navigator.of(context).pushNamed(OtpScreen.routeName);
        },
      );
    } on AuthException catch (e) {
      showAlertDialog(context: context, message: e.message);
    }
  }

  void verifyPhoneNumberWithOtp(
      String phoneNumber, String otp, BuildContext context) async {
    try {
      final response = await supabaseAuth.verifyOTP(
          type: OtpType.sms, phone: phoneNumber, token: otp);
      log(response.toString());
      log(response.user!.phone.toString());
      if (response.session != null) {
        //Navigator.of(context).pushNamed(OtpScreen.routeName);
        showAlertDialog(context: context, message: "Success");
      }
    } on AuthException catch (e) {
      showAlertDialog(context: context, message: e.message);
    }
  }
}
