import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle(
    {double? fontSize,
    FontWeight? fontWeight,
    TextDecoration? textDecoration,
    Color? color,TextStyle? textStyle,
    FontStyle? fontStyle,
        double? letterSpacing}) {
  return GoogleFonts.poppins(
      fontSize: fontSize,
      textStyle: textStyle,
      color: color,
      fontWeight: fontWeight,
      decoration: textDecoration,
      letterSpacing: letterSpacing,
      fontStyle: fontStyle,);
}
