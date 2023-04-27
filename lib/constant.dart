import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

kCustomText(
        {double fontSize = 16.0,
        Color? color,
        FontWeight fontWeight = FontWeight.normal}) =>
    GoogleFonts.rubik(fontSize: fontSize, color: color, fontWeight: fontWeight);

kCustumButton({
  Color? color,
  double radius = 15.0,
}) =>
    ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
