import 'package:flutter/material.dart';
import 'package:todoapp/core/Router/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/core/utility/constant/color_manger.dart';

class CustomFolatingActionButton extends StatelessWidget {
  const CustomFolatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.taskScreen);
      },
      child: Material(
        borderRadius: BorderRadius.circular(15.r),
        elevation: 10,
        child: Container(
          width: 70.w,
          height: 70.h,
          decoration: BoxDecoration(
            color: ColorsManger.primaryColor,
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: const Icon(
            Icons.add,
            color: ColorsManger.white,
          ),
        ),
      ),
    );
  }
}