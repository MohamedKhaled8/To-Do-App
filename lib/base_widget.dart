import 'package:flutter/material.dart';
import 'package:todoapp/core/utility/data/hive_data_store.dart';

class BaseWidget extends InheritedWidget {
  final HiveDataStoreImp dataStore = HiveDataStoreImp();
  final Widget child;

  BaseWidget({
    super.key,
    required this.child,
  }) : super(child: child);

  static BaseWidget of(BuildContext context) {
    final base = context.dependOnInheritedWidgetOfExactType<BaseWidget>();

    if (base != null) {
      return base;
    } else {
      throw StateError("Could not find ancestor widget of type BaseWidget.");
    }
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
  }
}
