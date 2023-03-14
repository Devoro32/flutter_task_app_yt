//https://youtu.be/PD0eAXLd5ls?t=879

import 'package:equatable/equatable.dart';
import 'package:tasks_app/models/tasks.dart';
import 'package:tasks_app/blocs/bloc_export.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

//https://youtu.be/PD0eAXLd5ls?t=960
//https://youtu.be/PD0eAXLd5ls?t=2110
class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    late final state = this.state;

    emit(TasksState(
      pendingTasks: List.from(state.pendingTasks)..add(event.task),
      //https://youtu.be/PD0eAXLd5ls?t=3770
      //ensure that when you add tasks, it is not removed from the bin
      removedTasks: state.removedTasks,

      //https://youtu.be/PD0eAXLd5ls?t=5256
      completedTasks: state.completedTasks,
      favoriteTasks: state.favoriteTasks,
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    //https://youtu.be/PD0eAXLd5ls?t=1783
    final state = this.state;
    final task = event.task;

    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completedTasks = state.completedTasks;
    task.isDone == false
        //https://youtu.be/PD0eAXLd5ls?t=1914
        // ? pendingTasks.add(task.copyWith(isDone: true))
        // : pendingTasks.add(task.copyWith(isDone: false));
        //https://youtu.be/PD0eAXLd5ls?t=5335
        ? {
            pendingTasks = List.from(pendingTasks)..remove(task),
            completedTasks = List.from(completedTasks)
              ..insert(0, task.copyWith(isDone: true)),
          }
        : {
            //https://youtu.be/PD0eAXLd5ls?t=5380

            completedTasks = List.from(completedTasks)..remove(task),
            pendingTasks = List.from(pendingTasks)
              ..insert(0, task.copyWith(isDone: false)),
          };

    emit(TasksState(
      pendingTasks: pendingTasks,
      //https://youtu.be/PD0eAXLd5ls?t=3770
      //ensure that when you add tasks, it is not removed from the bin
      removedTasks: state.removedTasks,
      //https://youtu.be/PD0eAXLd5ls?t=5401
      //! why is this note state.completedTasks?
      completedTasks: completedTasks,
      favoriteTasks: state.favoriteTasks,
    ));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    //https://youtu.be/PD0eAXLd5ls?t=1985
    final state = this.state;

    emit(
      TasksState(
        //https://youtu.be/PD0eAXLd5ls?t=3839
        // pendingTasks: List.from(state.pendingTasks)..remove(event.task),
        pendingTasks: state.pendingTasks,
        removedTasks: List.from(state.removedTasks)..remove(event.task),
        //https://youtu.be/PD0eAXLd5ls?t=5411
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
      ),
    );
  }

//https://youtu.be/PD0eAXLd5ls?t=3380
  void _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    //https://youtu.be/PD0eAXLd5ls?t=1985
    final state = this.state;

    emit(
      TasksState(
        pendingTasks: List.from(state.pendingTasks)..remove(event.task),
        //https://youtu.be/PD0eAXLd5ls?t=5411
        completedTasks: List.from(state.completedTasks)..remove(event.task),
        favoriteTasks: List.from(state.favoriteTasks)..remove(event.task),
        removedTasks: List.from(state.removedTasks)
          ..add(
            event.task.copyWith(isDeleted: true),
          ),
      ),
    );
  }

//https://youtu.be/PD0eAXLd5ls?t=2138
  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

//https://youtu.be/PD0eAXLd5ls?t=2138
  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
