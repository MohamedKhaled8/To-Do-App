import 'package:flutter/material.dart';
import 'package:todoapp/base_widget.dart';
import 'package:todoapp/core/utility/helper/spacing.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/core/utility/constant/my_string.dart';
import 'package:todoapp/core/utility/constant/color_manger.dart';
import 'package:todoapp/feature/todo/data/model/task_model.dart';
import 'package:todoapp/feature/home/widget/custom_empty_task.dart';
import 'package:todoapp/feature/home/widget/custom_task_home_widget.dart';

class CustomTaskHomeScreenWidget extends StatelessWidget {
  final BaseWidget base;
  final List<TaskModel> tasks;
  const CustomTaskHomeScreenWidget({
    Key? key,
    required this.base,
    required this.tasks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 400.h,
      child: tasks.isNotEmpty
          ? ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                var task = tasks[index];
                return Dismissible(
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction) {
                    base.dataStore.deleteTask(task: task);
                  },
                  background: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.delete_outline, color: ColorsManger.red),
                      horizintalSpace(8),
                      const Text(
                        MyStrings.deletedTask,
                        style: TextStyle(
                          color: ColorsManger.grey,
                        ),
                      )
                    ],
                  ),
                  key: Key(
                    task.id,
                  ), // Changed from Key(index.toString())
                  child: CustomTaskHomeWidget(taskModel: task),
                );
              },
            )
          : CustomEmptyTaskHomeWidget(tasks: tasks),
    );
  }
}
