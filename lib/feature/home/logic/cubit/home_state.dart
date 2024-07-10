part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}
class HomeLoaded extends HomeState {
  final List<TaskModel> tasks;

  HomeLoaded({required this.tasks});
}
class HomeTaskModelUpdated extends HomeState {
  final TaskModel taskModel;

  HomeTaskModelUpdated({required this.taskModel});
}