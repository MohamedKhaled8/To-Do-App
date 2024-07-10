import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/core/utility/helper/extensions.dart';
import 'package:todoapp/core/utility/constant/my_string.dart';
import 'package:todoapp/core/utility/constant/color_manger.dart';
import 'package:todoapp/feature/todo/logic/cubit/task_cubit.dart';
import 'package:todoapp/core/utility/widgets/custom_button_local.dart';

class CustomButtonsAddAndUpdateAnDeleteTaskWidget extends StatelessWidget {
  const CustomButtonsAddAndUpdateAnDeleteTaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<TaskCubit>();

    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        mainAxisAlignment: cubit.isTaskAlreadyExist()
            ? MainAxisAlignment.spaceEvenly
            : MainAxisAlignment.center,
        children: [
          cubit.isTaskAlreadyExist()
              ? CustomButtonLocal(
                  borderRadius: BorderRadius.circular(15.r),
                  width: 150.w,
                  height: 55.h,
                  title: MyStrings.deleteTask,
                  fontSize: 18.sp,
                  color: ColorsManger.primaryColor,
                  isColor: false,
                  shadowColor: Colors.grey.withOpacity(0.5),
                  icon: Icons.close,
                  colorIcon: ColorsManger.primaryColor,
                  iconSize: 25.h,
                  onTap: () {
                    cubit.deleteTask();
                    context.pop();
                  },
                )
              : const SizedBox.shrink(),
          CustomButtonLocal(
            borderRadius: BorderRadius.circular(15.r),
            width: 150.w,
            height: 55.h,
            title: cubit.isTaskAlreadyExist()
                ? MyStrings.updateTaskString
                : MyStrings.addTask,
            fontSize: 18.sp,
            color: ColorsManger.primaryColor,
            isColor: true,
            colorIcon: ColorsManger.white,
            iconSize: 25.h,
            icon: null,
            onTap: () {
              cubit.isTaskAlreadyExistUpdateOtherWiseCreate(context);
            },
          ),
        ],
      ),
    );
  }
}

