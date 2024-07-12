import 'package:flutter/material.dart';

class AppTextStyles {
  static const String _fontFamily = "manrope";

  static TextStyle get bodyLarge {
    return const TextStyle(
      height: 24 / 18,
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 18,
      color: Colors.black,
      letterSpacing: 0.02,
    );
  }

  static TextStyle get body {
    return const TextStyle(
      height: 21 / 16,
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 16,
      color: Colors.black,
      letterSpacing: 0.02,
    );
  }

  static TextStyle get bodySmall {
    return const TextStyle(
      height: 18 / 14,
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Colors.black,
      letterSpacing: 0.02,
    );
  }

  static TextStyle get bodyXSmall {
    return const TextStyle(
      height: 17 / 12,
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color: Colors.black,
      letterSpacing: 0.02,
    );
  }

  static TextStyle get button {
    return const TextStyle(
      height: 24 / 15,
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: 15,
      color: Colors.black,
      letterSpacing: 0.02,
    );
  }

  static TextStyle get headingXXL {
    return const TextStyle(
      height: 50 / 36,
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 36,
      color: Colors.black,
    );
  }

  static TextStyle get headingXL {
    return const TextStyle(
      height: 40 / 30,
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 30,
      color: Colors.black,
    );
  }

  static TextStyle get headingL {
    return const TextStyle(
      height: 34 / 24,
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 24,
      color: Colors.black,
    );
  }

  static TextStyle get headingM {
    return const TextStyle(
      height: 31 / 21,
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 21,
      color: Colors.black,
    );
  }

  static TextStyle get headingCaptionXL {
    return const TextStyle(
      height: 28 / 19,
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 19,
      color: Colors.black,
    );
  }

  static TextStyle get headingCaptionL {
    return const TextStyle(
      height: 26 / 17,
      fontFamily: _fontFamily,
      fontWeight: FontWeight.w700,
      fontSize: 17,
      color: Colors.black,
    );
  }
}
