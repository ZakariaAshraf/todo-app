import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFF5D9CEC),
    scaffoldBackgroundColor: Color(0xFFDFECDB),
    appBarTheme: AppBarTheme(
      toolbarHeight: 100,
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Color(0xFF5D9CEC),
      elevation: 0.0,
      centerTitle: false,
      titleTextStyle: GoogleFonts.elMessiri(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Color(0xFF5D9CEC),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedIconTheme: IconThemeData(
        size: 32,
        color: Color(0xFF5D9CEC),
      ),
      selectedItemColor:Color(0xFF5D9CEC),
      unselectedIconTheme: IconThemeData(
        size: 32,
        color: Colors.grey.shade700,
      ),
      unselectedItemColor: Colors.grey.shade700,
    ),
    textTheme: TextTheme(
        titleLarge: GoogleFonts.poppins(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        bodyLarge: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: Colors.white,
        ),
        bodyMedium: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: Color(0xFF5D9CEC),
        ),
        bodySmall: GoogleFonts.elMessiri(
          fontSize: 20,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        )),
    cardTheme: CardTheme(
      color:  Color(0xFF5D9CEC),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor:  const Color(0xFF5D9CEC),
      elevation: 0,

    )
  );

  static ThemeData darkTheme = ThemeData(
      primaryColor: const Color(0xFFB7935F),
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        titleTextStyle: GoogleFonts.elMessiri(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(
          size: 32,
          color: Colors.black,
        ),
        selectedItemColor: Colors.black,
        unselectedIconTheme: IconThemeData(
          size: 26,
          color: Colors.white,
        ),
        unselectedItemColor: Colors.white,
      ));
}