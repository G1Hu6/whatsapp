import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';

class StyledButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const StyledButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 40),
                  backgroundColor: primaryColor),
              child:  Text(
               text,
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: backgroundColor),
              ));
  }
}