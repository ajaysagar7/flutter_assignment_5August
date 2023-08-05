import 'package:elred_assignment_2/config/app_keys.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Utils {
  static showSnackBar({required String message, bool isError = false}) {
    AppKeys.scaffoldMessaerKey.currentState!.hideCurrentSnackBar();

    AppKeys.scaffoldMessaerKey.currentState!.showSnackBar(SnackBar(
      content: Text(
        message,
        style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
      ),
      backgroundColor: isError ? Colors.red : Colors.green,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      behavior: SnackBarBehavior.floating,
      // duration: const Duration(milliseconds: 800),
    ));
  }
}
