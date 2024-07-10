import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/core/utility/constant/my_string.dart';
import 'package:todoapp/core/utility/constant/color_manger.dart';
import 'package:todoapp/feature/todo/data/model/task_model.dart';

class CustomEmptyTaskHomeWidget extends StatelessWidget {
  const CustomEmptyTaskHomeWidget({
    super.key,
    required this.tasks,
  });

  final List<TaskModel> tasks;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FadeInUp(
          child: SizedBox(
            height: 190.h,
            width: 190.w,
            child: Lottie.asset(
              "assets/json/note.json",
              animate: tasks.isNotEmpty ? false : true,
            ),
          ),
        ),
        FadeInUp(
          from: 30,
          child: Text(
            MyStrings.doneAllTask,
            style: TextStyle(
              color: ColorsManger.black,
              fontSize: 20.sp,
            ),
          ),
        ),
      ],
    );
  }
}
