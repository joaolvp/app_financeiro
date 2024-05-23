import 'package:flutter/painting.dart';

class AppTextStyles {
  AppTextStyles._();

  static TextStyle bigText = const TextStyle(
      fontFamily: 'Roboto', fontSize: 50, fontWeight: FontWeight.w700);

  static TextStyle mediumText = const TextStyle(
      fontFamily: 'Roboto', fontSize: 36, fontWeight: FontWeight.w700);

  static TextStyle mediumText30 = const TextStyle(
      fontFamily: 'Roboto', fontSize: 30, fontWeight: FontWeight.w700);

  static TextStyle mediumText16 = const TextStyle(
      fontFamily: 'Roboto', fontSize: 16, fontWeight: FontWeight.w500);

  static TextStyle mediumText18 = const TextStyle(
      fontFamily: 'Roboto', fontSize: 18, fontWeight: FontWeight.w500);

  static TextStyle mediumText20 = const TextStyle(
      fontFamily: 'Roboto', fontSize: 20, fontWeight: FontWeight.w500);

  static TextStyle smallTextW500 = const TextStyle(
      fontFamily: 'Roboto', fontSize: 14, fontWeight: FontWeight.w500);

  static TextStyle smallText13 = const TextStyle(
      fontFamily: 'Roboto', fontSize: 13, fontWeight: FontWeight.w400);
  
  static TextStyle inputLabelText = const TextStyle(
      fontFamily: 'Roboto', fontSize: 14, fontWeight: FontWeight.w400);
}
