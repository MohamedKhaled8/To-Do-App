import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/core/utility/constant/color_manger.dart';

class CustomDateTimeSelection extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String time;
  final bool isTime;
  const CustomDateTimeSelection({
    Key? key,
    required this.onTap,
    required this.title,
    required this.time,
    this.isTime = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0.h),
        height: 52.h,
        decoration: BoxDecoration(
          color: ColorsManger.white,
          border: Border.all(color: ColorsManger.grey),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Text(
                title,
                style: textTheme.headlineSmall,
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10.w),
              width: isTime ? 150.w : 80.w,
              height: 35.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: ColorsManger.greyShade,
              ),
              child: Center(
                child: Text(
                  time,
                  style: textTheme.titleSmall,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
