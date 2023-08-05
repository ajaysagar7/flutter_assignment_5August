import 'package:elred_assignment_2/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyles {
  static TextStyle logoTextStyle = GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white);

  static TextStyle textFiledStyle14or16 = GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey);

  static TextStyle questionTextStyle = GoogleFonts.poppins(
      fontSize: 28,
      fontWeight: FontWeight.w500,
      color: AppColors.lightOrangeColor);

  //! textfiled-border-style
  static OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: AppColors.borderColor, width: 1));

  //! buttons-styles
  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      backgroundColor: AppColors.primaryColor,
      disabledBackgroundColor: AppColors.lightOrangeColor.withOpacity(0.5),
      disabledForegroundColor: AppColors.blackColor,
      foregroundColor: AppColors.blackColor);
}
