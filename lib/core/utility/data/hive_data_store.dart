import 'package:hive/hive.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoapp/feature/todo/data/model/task_model.dart';

class HiveDataStoreImp {
  static const boxName = 'taskBox';

  final Box<TaskModel> box = Hive.box(boxName);

  Future<void> addTask(TaskModel task) async {
    await box.put(task.id, task);
  }

  Future<TaskModel?> getTask({required String id}) async {
    return box.get(id);
  }

  Future<void> updatetask({required TaskModel task}) async {
    await task.save();
  }

  Future<void> deleteTask({required TaskModel task}) async {
    await task.delete();
  }

  ValueListenable<Box<TaskModel>> listenToTask() => box.listenable();
}
