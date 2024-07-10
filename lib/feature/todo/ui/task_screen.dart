import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/feature/todo/data/model/task_model.dart';
import 'package:todoapp/feature/todo/logic/cubit/task_cubit.dart';
import 'package:todoapp/feature/todo/widgets/custom_add_task.dart';
import 'package:todoapp/feature/todo/widgets/custom_divider_widget.dart';
import 'package:todoapp/feature/todo/widgets/custom_task_view_app_bar.dart';
import 'package:todoapp/feature/todo/widgets/custom_buttons_add_and_update_and_delete_task_widget.dart';

class TaskScreen extends StatelessWidget {
  final TaskModel? task;
  const TaskScreen({
    Key? key,
    this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(
        task: task,
        titleController: TextEditingController(),
        descriptionController: TextEditingController(),
      ),
      child: BlocBuilder<TaskCubit, TaskState>(
        builder: (context, state) {
          return Scaffold(
            appBar: const CustomTaskScreenAppBar(),
            body: InkWell(
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
              child: const SingleChildScrollView(
                child: Column(
                  children: [
                    CustomDividerWidget(),
                    CustomAddTask(),
                  ],
                ),
              ),
            ),
            bottomNavigationBar:
                const CustomButtonsAddAndUpdateAnDeleteTaskWidget(),
          );
        },
      ),
    );
  }
}
