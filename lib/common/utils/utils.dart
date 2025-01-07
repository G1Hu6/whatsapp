import 'package:flutter/material.dart';
import 'package:whatsapp_ui/colors.dart';

showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

showAlertDialog(
    {required BuildContext context, required String message}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: alertDialogColor,
        actionsPadding: const EdgeInsets.only(bottom: 10, right: 20),
        actions: [
          TextButton(
              style: ButtonStyle(
                  overlayColor:
                      WidgetStatePropertyAll(primaryColor.withOpacity(0.15))),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Ok",
                style: TextStyle(color: primaryColor),
              ))
        ],
        content: Text(message),
      );
    },
  );
}
