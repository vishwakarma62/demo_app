import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import '../../model/task.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTaskEvent>(addTaskEvent);
    on<UpdateTaskEvent>(updateTaskEvent);
    on<DeleteTaskEvent>(deleteTaskEvent);
    on<RemoveTaskEvent>(removeTaskEvent);
  }

  FutureOr<void> addTaskEvent(AddTaskEvent event, Emitter<TaskState> emit) {
    final state = this.state;

    emit(TaskState(
        pendingtask: List.from(state.pendingtask)..add(event.task),
        removetask: state.removetask,
        completetask: state.completetask,
        favoritetask: state.favoritetask));
  }

  FutureOr<void> updateTaskEvent(
      UpdateTaskEvent event, Emitter<TaskState> emit) {
    final state = this.state;
    //var task = event.task;

    List<Task> pendingtask = state.pendingtask;
    List<Task> completetask = state.completetask;

    event.task.isdone == false
        ? {
            pendingtask = List.from(pendingtask)..remove(event.task),
            completetask = List.from(completetask)
              ..insert(0, event.task.copyWith(isdone: true)),
          }
        : {
            completetask = List.from(completetask)..remove(event.task),
            pendingtask = List.from(pendingtask)
              ..insert(0, event.task.copyWith(isdone: false)),
          };

    emit(TaskState(
        pendingtask: pendingtask,
        completetask: completetask,
        removetask: state.removetask,
        favoritetask: state.favoritetask));
  }

  FutureOr<void> deleteTaskEvent(
      DeleteTaskEvent event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
      pendingtask: state.pendingtask,
      completetask: state.completetask,
      favoritetask: state.favoritetask,
      removetask: List.from(state.removetask)..remove(event.task),
    ));
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }

  FutureOr<void> removeTaskEvent(
      RemoveTaskEvent event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(TaskState(
        pendingtask: List.from(state.pendingtask)..remove(event.task),
        completetask: List.from(state.completetask)..remove(event.task),
        favoritetask: List.from(state.favoritetask)..remove(event.task),
        removetask: List.from(state.removetask)
          ..add(event.task.copyWith(isdeleted: true))));
  }
}
