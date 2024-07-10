import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/base_widget.dart';
import 'package:todoapp/core/utility/constant/f_toast.dart';
import 'package:todoapp/feature/todo/data/model/task_model.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskModel? task;
   final TextEditingController titleController;
  final TextEditingController descriptionController;

  TaskCubit({
    required this.task,
    required this.titleController,
    required this.descriptionController,
  }) : super(TaskInitial()) {
    titleController.text = task?.title ?? '';
    descriptionController.text = task?.subTitle ?? '';
  }

  var title;
  var subTitle;
  DateTime? time;
  DateTime? date;

  String showTime(DateTime? time) {
    if (task?.createAtTime == null) {
      if (time == null) {
        return DateFormat('hh:mm a').format(DateTime.now()).toString();
      } else {
        return DateFormat('hh:mm a').format(time).toString();
      }
    } else {
      return DateFormat('hh:mm a').format(task!.createAtTime).toString();
    }
  }

  String showDate(DateTime? date) {
    if (task?.createAtDate == null) {
      if (date == null) {
        return DateFormat.yMMMEd().format(DateTime.now()).toString();
      } else {
        return DateFormat.yMMMEd().format(date).toString();
      }
    } else {
      return DateFormat.yMMMEd().format(task!.createAtDate).toString();
    }
  }

  DateTime showDateAsDateTime(DateTime? date) {
    if (task?.createAtDate == null) {
      if (date == null) {
        return DateTime.now();
      } else {
        return date;
      }
    } else {
      return task!.createAtDate;
    }
  }

  bool isTaskAlreadyExist() {
    return task != null;
  }

  dynamic isTaskAlreadyExistUpdateOtherWiseCreate(BuildContext context) {
     title = titleController.text;
    subTitle = descriptionController.text;

    if (title != null && subTitle != null) {
      try {
        if (isTaskAlreadyExist()) {
          task!.title = title;
          task!.subTitle = subTitle;
          task!.createAtDate = date ?? task!.createAtDate;
          task!.createAtTime = time ?? task!.createAtTime;
          task!.save(); // Save the updated task
        } else {
          var newTask = TaskModel.create(
            title: title,
            subTitle: subTitle,
            createAtDate: date,
            createAtTime: time,
          );
          BaseWidget.of(context).dataStore.addTask(newTask);
        }
        emit(TaskInitial());
        Navigator.pop(context);
      } catch (e) {
        emit(TaskInitial());
        updateTaskWarning(context);
      }
    } else {
      emptyWarning(context);
    }
  }

  void deleteTask() {
    task?.delete();
    emit(TaskInitial());
  }


    void updateTime(DateTime newTime) {
    time = newTime;
    emit(TaskInitial());
  }

  void updateDate(DateTime newDate) {
    date = newDate;
    emit(TaskInitial());
  }

  @override
  Future<void> close() {
    titleController.dispose();
    descriptionController.dispose();
    return super.close();
  }
}
