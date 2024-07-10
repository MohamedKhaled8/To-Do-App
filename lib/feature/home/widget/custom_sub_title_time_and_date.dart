import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/core/utility/constant/color_manger.dart';
import 'package:todoapp/feature/todo/data/model/task_model.dart';
import 'package:todoapp/feature/home/logic/cubit/home_cubit.dart';

class CustomSubtitleTimeAndDate extends StatelessWidget {
  final TaskModel taskModel;
  const CustomSubtitleTimeAndDate({
    Key? key,
    required this.taskModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cubit.textEditingControllerForSubTitle.text,
          style: TextStyle(
              color:taskModel.isCompleted
                  ? ColorsManger.primaryColor
                  : ColorsManger.black,
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
              decoration: taskModel.isCompleted
                  ? TextDecoration.lineThrough
                  : null),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  DateFormat('hh:mm a').format(taskModel.createAtTime),
                  style: TextStyle(
                    color:taskModel.isCompleted
                        ? ColorsManger.white
                        : ColorsManger.grey,
                    fontSize: 14.sp,
                  ),
                ),
                Text(
                  DateFormat.yMMMEd().format(taskModel.createAtDate),
                  style: TextStyle(
                    color: taskModel.isCompleted
                        ? ColorsManger.white
                        : ColorsManger.grey,
                    fontSize: 12.sp,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}