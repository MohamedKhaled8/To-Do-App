import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:todoapp/core/utility/data/hive_data_store.dart';
import 'package:todoapp/feature/todo/data/model/task_model.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HiveDataStoreImp dataStore;
  late ValueListenable<Box<TaskModel>> _taskListenable;
  HomeCubit({required this.dataStore}) : super(HomeInitial()) {
    _taskListenable = dataStore.listenToTask();
    _taskListenable.addListener(loadTasks);
    loadTasks(); // Initial load
  }

  final GlobalKey<SliderDrawerState> _drawerKey =
      GlobalKey<SliderDrawerState>();

  GlobalKey<SliderDrawerState> get drawerKey => _drawerKey;

final TextEditingController _textEditingControllerForTitle =
      TextEditingController();
  final TextEditingController _textEditingControllerForSubTitle =
      TextEditingController();

  TextEditingController get textEditingControllerForTitle =>
      _textEditingControllerForTitle;
  TextEditingController get textEditingControllerForSubTitle =>
      _textEditingControllerForSubTitle;


  void setTaskModel(TaskModel taskModel) {
    _textEditingControllerForTitle.text = taskModel.title;
    _textEditingControllerForSubTitle.text = taskModel.subTitle;
    emit(HomeTaskModelUpdated(taskModel: taskModel));
  }

  void disposeControllers() {
    _textEditingControllerForSubTitle.dispose();
    _textEditingControllerForTitle.dispose();
  }

  void loadTasks() {
    final box = _taskListenable.value;
    var tasks = box.values.toList();
    tasks.sort((a, b) => a.createAtDate.compareTo(b.createAtDate));
    emit(HomeLoaded(tasks: tasks));
  }

  dynamic valueOfIndicator(List<TaskModel> task) {
    if (task.isNotEmpty) {
      return task.length;
    } else {
      return 3;
    }
  }

  List<TaskModel> getSortedTasks() {
    final box = _taskListenable.value;
    var tasks = box.values.toList();
    tasks.sort((a, b) => a.createAtDate.compareTo(b.createAtDate));
    return tasks;
  }

  int checkDoneTask(List<TaskModel> task) {
    int i = 0;
    for (TaskModel doneTask in task) {
      if (doneTask.isCompleted) {
        i++;
      }
    }
    return i;
  }
}
