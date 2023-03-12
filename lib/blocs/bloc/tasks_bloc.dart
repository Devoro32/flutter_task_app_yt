//https://youtu.be/PD0eAXLd5ls?t=879

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasks_app/models/tasks.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

//https://youtu.be/PD0eAXLd5ls?t=960
class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    late final state = this.state;

    emit(TasksState(
      allTasks: List.from(state.allTasks)..add(event.task),
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {}

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {}
}
