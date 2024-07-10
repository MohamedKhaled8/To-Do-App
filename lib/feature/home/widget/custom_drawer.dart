import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:todoapp/core/utility/helper/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/core/utility/constant/color_manger.dart';

class CustomDrawer extends StatelessWidget {
  final List<IconData> icons = [
    CupertinoIcons.home,
    CupertinoIcons.person_fill,
    CupertinoIcons.settings,
    CupertinoIcons.info_circle_fill,
  ];

  final List<String> text = [
    "Home",
    "Profile",
    "Settings",
    "Details",
  ];

  CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.symmetric(vertical: 85.h),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: ColorsManger.primaryGradientColor,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 50.r,
            backgroundImage: const NetworkImage(
                "https://avatars.githubusercontent.com/u/104164260?v=4"),
          ),
          verticalSpace(8),
          Text(
            "Mohamed Khaled",
            style: textTheme.displayMedium,
          ),
          Text(
            "Flutter Devolper",
            style: textTheme.displaySmall,
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 25.h, horizontal: 10.w),
            child: SizedBox(
              width: double.infinity,
              height: 290.h,
              child: ListView.builder(
                  itemCount: icons.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // debugPrint('${text[index]}  Item Tapped!');
                      },
                      child: Container(
                        margin: EdgeInsets.all(3.r),
                        child: ListTile(
                          leading: Icon(
                            icons[index],
                            color: ColorsManger.white,
                            size: 30.h,
                          ),
                          title: Text(
                            text[index],
                            style: const TextStyle(color: ColorsManger.white),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
