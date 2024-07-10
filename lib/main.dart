import 'package:flutter/material.dart';
import 'package:todoapp/to_do_app.dart';
import 'package:todoapp/base_widget.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todoapp/core/Router/router.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/core/utility/data/hive_data_store.dart';
import 'package:todoapp/feature/todo/data/model/task_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter<TaskModel>(TaskModelAdapter());
  Box box = await Hive.openBox<TaskModel>(HiveDataStoreImp.boxName);
  for (var task in box.values) {
    if (task.createAtTime.day != DateTime.now().day) {
      task.delete();
    }
  }
  await ScreenUtil.ensureScreenSize();
  runApp(BaseWidget(
      child: ToDoApp(
    appRouter: AppRouter(),
  )));
}
