import 'package:flutter/material.dart';
import 'package:todoapp/core/Router/router.dart';
import 'package:todoapp/core/Router/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todoapp/core/utility/themes/app_theme.dart';

class ToDoApp extends StatelessWidget {
  final AppRouter appRouter;
  const ToDoApp({
    Key? key,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'To Do App',
          theme: AppTheme(),
          initialRoute: Routes.homeScreen,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generateRoute,
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQueryData.fromWindow(WidgetsBinding.instance.window),
              child: widget ?? const SizedBox.shrink(),
            );
          },
        );
      },
    );
  }
}
