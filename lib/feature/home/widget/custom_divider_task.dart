import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDividerTask extends StatelessWidget {
  const CustomDividerTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 10.h,
      ),
      child:  Divider(
        thickness: 2,
        indent: 100.w,
        endIndent: 10.w,
      ),
    );
  }
}