import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_ui/colors.dart';
import 'package:whatsapp_ui/features/auth/screens/otp_screen.dart';
import 'package:whatsapp_ui/features/landing/screens/welcome_screen.dart';
import 'package:whatsapp_ui/routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://dxcmqibwgmkhnosawxdv.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImR4Y21xaWJ3Z21raG5vc2F3eGR2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzYxMzU4MjMsImV4cCI6MjA1MTcxMTgyM30.S5rxOgv07u2zOaDgoOlv0_dWBjRmUz64OCUva_IdKc8',
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Whatsapp UI',
        onGenerateRoute: (settings) => generateRoutes(settings),
        theme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: backgroundColor,
            appBarTheme: const AppBarTheme(color: appBarColor)),
        home: const WelcomeScreen());
  }
}
