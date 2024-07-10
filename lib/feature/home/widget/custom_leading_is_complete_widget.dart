import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/core/utility/constant/color_manger.dart';
import 'package:todoapp/feature/todo/data/model/task_model.dart';

class CustomLeadingIsCompleate extends StatelessWidget {
  final TaskModel taskModel;
  const CustomLeadingIsCompleate({
    Key? key,
    required this.taskModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        taskModel.isCompleted = !taskModel.isCompleted;
        taskModel.save();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        decoration: BoxDecoration(
          color: taskModel.isCompleted
              ? ColorsManger.primaryColor
              : ColorsManger.white,
          shape: BoxShape.circle,
          border: Border.all(color: ColorsManger.grey, width: .8.w),
        ),
        child: const Icon(
          Icons.check,
          color: ColorsManger.white,
        ),
      ),
    );
  }
}