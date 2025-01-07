import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/features/auth/repositories/auth_repository.dart';


final authControllerProvider = Provider((ref) {
  return AuthController(authRepository: ref.watch(authRepositoryProvider));
});

class AuthController {

    final AuthRepository authRepository;

    AuthController({required this.authRepository});

    void signInWithPnoneNumber(String phoneNumber, BuildContext context){
       authRepository.signInWithPnoneNumber(phoneNumber, context);
    }

    void verifyPhoneNumberWithOtp(String phoneNumber, String otp ,BuildContext context){
      authRepository.verifyPhoneNumberWithOtp(phoneNumber, otp, context);
    }
}