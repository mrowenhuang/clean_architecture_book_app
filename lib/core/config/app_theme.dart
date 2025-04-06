import 'package:book_app/core/config/app_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData appTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: false,
      fontFamily: GoogleFonts.koHo().fontFamily,
    );
  }

  static EdgeInsets mocPadding = const EdgeInsets.only(
    bottom: 20,
    left: 20,
    right: 20,
    top: 50,
  );
  static EdgeInsets moc2Padding = const EdgeInsets.only(
    bottom: 20,
    left: 20,
    right: 20,
  );
  static EdgeInsets defPadding = const EdgeInsets.all(20);

  static AppBar customAppbar(String title, BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      title: Padding(
        padding: EdgeInsets.only(top: 40),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColor.primary,
          ),
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: EdgeInsets.only(top: 40),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 30,
            color: AppColor.primary,
          ),
        ),
      ),
    );
  }

  static AppBar defAppbar(String title, BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColor.primary,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_rounded,
          size: 30,
          color: AppColor.primary,
        ),
      ),
    );
  }
}
