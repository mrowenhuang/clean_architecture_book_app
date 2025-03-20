import 'package:book_app/core/config/app_color.dart';
import 'package:flutter/material.dart';

Widget titlePasswordTextField(
  String title,
  String hintText,
  TextEditingController controller,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      SizedBox(height: 5),
      Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(8),
        child: TextField(
          controller: controller,
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: hintText,
            fillColor: AppColor.secondary,
            filled: true,
          ),
        ),
      ),
    ],
  );
}
