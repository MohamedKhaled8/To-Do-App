import 'package:flutter/material.dart';
import '../logic/cubit/home_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/feature/todo/ui/task_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'build_box_de_ani_container_home_screen_widget.dart';
import 'package:todoapp/feature/todo/data/model/task_model.dart';
import 'package:todoapp/core/utility/constant/color_manger.dart';
import 'package:todoapp/feature/home/widget/custom_sub_title_time_and_date.dart';
import 'package:todoapp/feature/home/widget/custom_leading_is_complete_widget.dart';

class CustomTaskHomeWidget extends StatelessWidget {
  final TaskModel taskModel;
  const CustomTaskHomeWidget({
    Key? key,
    required this.taskModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<HomeCubit>();
    cubit.setTaskModel(taskModel);

    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return TaskScreen(
            task: taskModel,
          );
        }));
      },
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: buildBoxDecorAniConainertHome(taskModel: taskModel),
        duration: const Duration(milliseconds: 600),
        child: ListTile(
          title: Padding(
            padding: EdgeInsets.only(bottom: 5.h, top: 30.h),
            child: Text(
              cubit.textEditingControllerForTitle.text,
              style: TextStyle(
                  color: taskModel.isCompleted
                      ? ColorsManger.primaryColor
                      : ColorsManger.black,
                  fontWeight: FontWeight.w500,
                  decoration: taskModel.isCompleted
                      ? TextDecoration.lineThrough
                      : null),
            ),
          ),
          subtitle: CustomSubtitleTimeAndDate(
            taskModel: taskModel,
          ),
          leading: CustomLeadingIsCompleate(
            taskModel: taskModel,
          ),
        ),
      ),
    );
  }
}
