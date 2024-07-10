import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String subTitle;
  @HiveField(3)
  DateTime createAtTime; // Change to DateTime
  @HiveField(4)
  DateTime createAtDate; // Change to DateTime
  @HiveField(5)
  bool isCompleted;
@HiveField(6)
  int color;
  TaskModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.createAtTime,
    required this.createAtDate,
    required this.isCompleted,
    required this.color,
  });

  factory TaskModel.create({
    required String? title,
    required String? subTitle,
    DateTime? createAtDate,
    DateTime? createAtTime,
     int? color
  }) {
    final date = createAtDate ?? DateTime.now();
    final time = createAtTime ?? DateTime.now();

    return TaskModel(
      id: const Uuid().v1(),
      title: title ?? "",
      subTitle: subTitle ?? "",
      createAtDate: date,
      createAtTime: time,
      isCompleted: false,
      color: color ?? Colors.white.value, // Default color
    );
  }
}
