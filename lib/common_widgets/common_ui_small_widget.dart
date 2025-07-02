import 'package:flutter/material.dart';

class CommonUiSmallWidgets {
  static void showMessage(
    BuildContext context,
    String message,
    Color color,
    Color textColor,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: color,
        content: Text(
          message,
        ),
      ),
    );
  }
}
