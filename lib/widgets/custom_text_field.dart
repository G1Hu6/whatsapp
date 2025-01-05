import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.hintText,
    required this.validator,
    required this.onSaved,
    this.icon,
    this.labelStyle,
    this.prefixIcon,
    this.bgColor,
    this.isHiddenPassword,
  });

  final String hintText;
  final FormFieldValidator<String>? validator;
  final void Function(String?)? onSaved;
  bool? isHiddenPassword;
  Widget? icon;
  Color? bgColor;
  TextStyle? labelStyle;
  Icon? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      height: 50,
      child: TextFormField(
        scrollPadding: const EdgeInsets.all(0),
        keyboardType: TextInputType.text,
        validator: validator,
        onSaved: onSaved,
        obscureText: (isHiddenPassword == null) ? false : isHiddenPassword!,
        decoration: InputDecoration(
          filled: true,
          fillColor: (bgColor == null) ? senderMessageColor : bgColor,
          prefixIcon: prefixIcon,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color.fromARGB(212, 151, 165, 163),
          ),
          suffixIcon: icon,
        ),
      ),
    );
  }
}
