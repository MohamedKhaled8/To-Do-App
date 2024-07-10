import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:todoapp/base_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/core/utility/constant/f_toast.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

class CustomHomeAppBar extends StatefulWidget {
  const CustomHomeAppBar({super.key, required this.drawerKey});
  final GlobalKey<SliderDrawerState> drawerKey;

  @override
  State<CustomHomeAppBar> createState() => _CustomHomeAppBarState();
}

class _CustomHomeAppBarState extends State<CustomHomeAppBar>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool isDrawerOpen = false;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void onDrawerToogle() {
    setState(() {
      isDrawerOpen = !isDrawerOpen;
      if (isDrawerOpen) {
        animationController.forward();
        widget.drawerKey.currentState!.openSlider();
      } else {
        animationController.reverse();
        widget.drawerKey.currentState!.closeSlider();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var base = BaseWidget.of(context).dataStore.box;
    return SizedBox(
      width: double.infinity,
      height: 125.h,
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: IconButton(
                  onPressed: onDrawerToogle,
                  icon: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: animationController,
                    size: 30.h,
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(right: 20.w),
              child: IconButton(
                onPressed: () {
                  base.isEmpty
                      ? noTaskWarning(context)
                      : deleteAllTask(context);
                },
                icon: Icon(
                  CupertinoIcons.trash_fill,
                  size: 30.h,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
