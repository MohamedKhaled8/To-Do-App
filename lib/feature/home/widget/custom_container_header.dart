import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import '../logic/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/core/utility/helper/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/core/utility/constant/my_string.dart';
import 'package:todoapp/feature/todo/data/model/task_model.dart';
import 'package:todoapp/core/utility/constant/color_manger.dart';


class CustomContainerHeader extends StatelessWidget {
  final Box<TaskModel> box;
  final List<TaskModel> task; // Add task parameter

  const CustomContainerHeader({
    Key? key,
    required this.box,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    var cubit = context.read<HomeCubit>();

    return Container(
      margin: EdgeInsets.only(top: 10.h),
      height: 100.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 30.w,
            height: 30.h,
            child: CircularProgressIndicator(
              value: cubit.checkDoneTask(task) / cubit.valueOfIndicator(task),
              backgroundColor: ColorsManger.white,
              valueColor:
                  const AlwaysStoppedAnimation(ColorsManger.primaryColor),
            ),
          ),
          horizintalSpace(25),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                MyStrings.mainTitle,
                style: textTheme.displayLarge,
              ),
              verticalSpace(3),
              Text(
                "${cubit.checkDoneTask(task)} of ${task.length} task",
                style: textTheme.titleMedium,
              )
            ],
          ),
        ],
      ),
    );
  }
}