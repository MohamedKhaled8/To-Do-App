import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/core/utility/constant/color_manger.dart';

// ignore: non_constant_identifier_names
ThemeData AppTheme() {
  return ThemeData(
    scaffoldBackgroundColor: ColorsManger.white,
    textTheme: TextTheme(
      displayLarge: TextStyle(
        color: ColorsManger.black,
        fontSize: 45.sp,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(color: ColorsManger.grey, fontSize: 16.sp),
      displayMedium: TextStyle(
          color: const Color.fromARGB(255, 234, 234, 234), fontSize: 21.sp),
      displaySmall: TextStyle(
          color: ColorsManger.grey,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400),
      headlineMedium: TextStyle(color: ColorsManger.grey, fontSize: 17.sp),
      headlineSmall: const TextStyle(
          color: ColorsManger.black, fontWeight: FontWeight.w500),
      titleSmall: const TextStyle(
          color: ColorsManger.black, fontWeight: FontWeight.w500),
      titleLarge: TextStyle(
          color: ColorsManger.black,
          fontSize: 40.sp,
          fontWeight: FontWeight.w300),
    ),
  );
}
