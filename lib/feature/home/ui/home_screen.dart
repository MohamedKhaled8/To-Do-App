import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/base_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/feature/home/widget/custom_drawer.dart';
import 'package:todoapp/feature/todo/data/model/task_model.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:todoapp/feature/home/logic/cubit/home_cubit.dart';
import 'package:todoapp/feature/home/widget/custom_divider_task.dart';
import 'package:todoapp/feature/home/widget/custom_home_app_bar.dart';
import 'package:todoapp/feature/home/widget/custom_container_header.dart';
import 'package:todoapp/feature/home/widget/custom_floating_action_button.dart';
import 'package:todoapp/feature/home/widget/custom_task_home_screen_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final base = BaseWidget.of(context);
    return BlocProvider(
      create: (context) => HomeCubit(dataStore: base.dataStore),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          var cubit = context.read<HomeCubit>();
          return ValueListenableBuilder(
              valueListenable: base.dataStore.listenToTask(),
              builder: (context, Box<TaskModel> box, Widget? child) {
                return Scaffold(
                  floatingActionButton: const CustomFolatingActionButton(),
                  body: SliderDrawer(
                    key: cubit.drawerKey,
                    isDraggable: false,
                    animationDuration: 1000,
                    appBar: CustomHomeAppBar(
                      drawerKey: cubit.drawerKey,
                    ),
                    slider: CustomDrawer(),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomContainerHeader(
                            box: box,
                            task: cubit
                                .getSortedTasks(), // Pass the task list here
                          ),
                          const CustomDividerTask(),
                          CustomTaskHomeScreenWidget(
                            base: base,
                            tasks: cubit.getSortedTasks(),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
