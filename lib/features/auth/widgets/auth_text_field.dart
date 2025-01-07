import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  final Color? hintColor;
  final Icon? suffixIcon;
  final Icon? prefixIcon;
  final bool readOnly;
  final bool alignCenter;
  final Function()? onTap;
  final TextEditingController controller;
  const AuthTextField(
      {super.key,
      required this.hintText,
      this.hintColor,
      this.suffixIcon,
      this.prefixIcon,
      required this.controller,
      this.readOnly = false,
      this.onTap,
      this.alignCenter = false});

  static const textFieldBorder =
      UnderlineInputBorder(borderSide: BorderSide(color: primaryColor));

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      controller: controller,
      textAlignVertical: TextAlignVertical.center,
      textAlign: (alignCenter) ? TextAlign.center : TextAlign.start,
      readOnly: readOnly,
      keyboardType: TextInputType.number,
      cursorColor: primaryColor,
      decoration: InputDecoration(
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 15,
            color: hintColor ?? greyColor,
          ),
          contentPadding: const EdgeInsets.only(bottom: 1),
          enabledBorder: textFieldBorder,
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: primaryColor, width: 2)),
          border: textFieldBorder,
          disabledBorder: textFieldBorder),
    );
  }
}
