import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/core/utility/constant/color_manger.dart';
import 'package:todoapp/feature/todo/data/model/task_model.dart';


BoxDecoration buildBoxDecorAniConainertHome(
    {required final TaskModel taskModel , 
    
    }) {
  return BoxDecoration(
    color: taskModel.isCompleted
        ? const Color.fromARGB(154, 119, 144, 229)
        : ColorsManger.white,
    borderRadius: BorderRadius.circular(15.r),
    boxShadow: [
      BoxShadow(
          color: ColorsManger.black.withOpacity(.1),
          offset: const Offset(0, 4),
          blurRadius: 10)
    ],
  );
}
