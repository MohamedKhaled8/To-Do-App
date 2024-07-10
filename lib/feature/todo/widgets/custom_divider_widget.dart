import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/core/utility/constant/my_string.dart';
import 'package:todoapp/feature/todo/logic/cubit/task_cubit.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TaskCubit>();
    TextTheme textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              width: 70.w,
              child: Divider(
                thickness: 2,
                endIndent: 10.w,
                indent: 10.w,
              ),
            ),
          ),
          RichText(
            text: TextSpan(
              text: cubit.isTaskAlreadyExist()
                  ? MyStrings.updateCurrentTask
                  : MyStrings.addNewTask,
              style: textTheme.titleLarge,
              children: const [
                TextSpan(
                  text: MyStrings.taskString,
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: 70.w,
              child: Divider(
                thickness: 2,
                endIndent: 10.w,
                indent: 10.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
