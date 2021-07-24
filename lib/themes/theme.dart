import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static const _lightFillColor = Colors.black;
  static const _darkFillColor = Colors.white;

  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor);
  static ThemeData darkThemeData = themeData(darkColorScheme, _darkFocusColor);

  static ThemeData themeData(ColorScheme colorScheme, Color focusColor) {
    return ThemeData(
      colorScheme: colorScheme,
      textTheme: _textTheme,
      // Matches manifest.json colors and background color.
      primaryColor: const Color(0xFF030303),
      appBarTheme: AppBarTheme(
        textTheme: _textTheme.apply(bodyColor: colorScheme.onPrimary),
        color: colorScheme.primary,
        elevation: 5,
        iconTheme: IconThemeData(color: colorScheme.primary),
        brightness: colorScheme.brightness,
      ),
      iconTheme: IconThemeData(color: colorScheme.onPrimary),
      highlightColor: Colors.transparent,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color.alphaBlend(
          _lightFillColor.withOpacity(0.80),
          _darkFillColor,
        ),
        contentTextStyle: _textTheme.subtitle1?.apply(color: _darkFillColor),
      ),
    );
  } 

  static const ColorScheme lightColorScheme = ColorScheme(
    primary: Color(0xFF26CE9A),
    primaryVariant: Color(0xFFFFFFFF),
    secondary: Color(0xFF26CE9A),
    secondaryVariant: Color(0xFFFAFBFB),
    background: Color(0xFFD8F2DE),
    surface: Color(0xFFFAFBFB),
    onBackground: Colors.white,
    error: _lightFillColor,
    onError: _lightFillColor,
    onPrimary: _lightFillColor,
    onSecondary: Color(0xFF322942),
    onSurface: Color(0xFF241E30),
    brightness: Brightness.light,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    primary: Color(0xFFFF8383),
    primaryVariant: Color(0xFF1CDEC9),
    secondary: Color(0xFF4D1F7C),
    secondaryVariant: Color(0xFF451B6F),
    background: Color(0xFF241E30),
    surface: Color(0xFF1F1929),
    onBackground: Color(0x0DFFFFFF), // White with 0.05 opacity
    error: _darkFillColor,
    onError: _darkFillColor,
    onPrimary: _darkFillColor,
    onSecondary: _darkFillColor,
    onSurface: _darkFillColor,
    brightness: Brightness.dark,
  );

  static const _regular = FontWeight.w400;
  static const _medium = FontWeight.w500;
  static const _semiBold = FontWeight.w600;
  static const _bold = FontWeight.w700;

  static final TextTheme _textTheme = TextTheme(
    headline1: GoogleFonts.notoSans(fontWeight: _bold, fontSize: 18.0, color: Colors.white),
    headline4: GoogleFonts.notoSans(fontWeight: _bold, fontSize: 15.0, color: Colors.white),
    caption: GoogleFonts.notoSans(fontWeight: _semiBold, fontSize: 16.0), // unuse
    headline5: GoogleFonts.notoSans(fontWeight: _medium, fontSize: 16.0), // unuse
    subtitle1: GoogleFonts.notoSans(fontWeight: _medium, fontSize: 16.0), // unuse
    overline: GoogleFonts.notoSans(fontWeight: _medium, fontSize: 12.0), // unuse
    bodyText1: GoogleFonts.notoSans(fontWeight: _bold, fontSize: 16.0, color: Color(0xFF030303)),
    subtitle2: GoogleFonts.notoSans(fontWeight: _medium, fontSize: 14.0), // unuse
    bodyText2: GoogleFonts.notoSans(fontWeight: _regular, fontSize: 16.0), // unuse
    headline6: GoogleFonts.notoSans(fontWeight: _bold, fontSize: 16.0), // unuse
    button: GoogleFonts.notoSans(fontWeight: _semiBold, fontSize: 14.0), // unuse
  );
}
