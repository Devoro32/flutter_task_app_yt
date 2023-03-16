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
    on<MarkFavoriteOrUnfavoriteTask>(_onMarkFavoriteOrUnfavoriteTask);
    on<EditTask>(_onEditTask);
    on<RestoreTask>(_onRestoreTask);
    on<DeleteAllTasks>(_onDeleteAllTasks);
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
//https://youtu.be/PD0eAXLd5ls?t=7579
    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completedTasks = state.completedTasks;
    List<Task> favoriteTasks = state.favoriteTasks;
    if (task.isDone == false) {
      if (task.isFavorite == false) {
        pendingTasks = List.from(pendingTasks)..remove(task);
        completedTasks = List.from(completedTasks);
      } else {
        var taskIndex = favoriteTasks.indexOf(task);
        pendingTasks = List.from(pendingTasks)..remove(task);
        completedTasks.insert(0, task.copyWith(isDone: true));
        favoriteTasks = List.from(favoriteTasks)
          ..remove(task)
          ..insert(taskIndex, task.copyWith(isDone: true));
      }
    } else {
      if (task.isFavorite == false) {
        completedTasks = List.from(completedTasks)..remove(task);
        pendingTasks = List.from(pendingTasks)
          ..insert(0, task.copyWith(isDone: false));
      } else {
        var taskIndex = favoriteTasks.indexOf(task);
        completedTasks = List.from(completedTasks)..remove(task);
        pendingTasks = List.from(pendingTasks)
          ..insert(0, task.copyWith(isDone: false));
        favoriteTasks = List.from(favoriteTasks)
          ..remove(task)
          ..insert(taskIndex, task.copyWith(isDone: false));
      }
    }

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

//https://youtu.be/PD0eAXLd5ls?t=6835

  void _onMarkFavoriteOrUnfavoriteTask(
      MarkFavoriteOrUnfavoriteTask event, Emitter<TasksState> emit) {
    final state = this.state;

    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completedTasks = state.completedTasks;
    List<Task> favoriteTasks = state.favoriteTasks;
    if (event.task.isDone == false) {
      if (event.task.isFavorite == false) {
        var taskIndex = pendingTasks.indexOf(event.task);
        pendingTasks = List.from(pendingTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: true));
        favoriteTasks.insert(0, event.task.copyWith(isFavorite: true));
      } else {
        var taskIndex = pendingTasks.indexOf(event.task);
        pendingTasks = List.from(pendingTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: false));
        favoriteTasks.remove(event.task);
      }
    } else {
      if (event.task.isFavorite == false) {
        var taskIndex = completedTasks.indexOf(event.task);
        completedTasks = List.from(completedTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: true));
        favoriteTasks.insert(0, event.task.copyWith(isFavorite: true));
      } else {
        var taskIndex = completedTasks.indexOf(event.task);
        completedTasks = List.from(completedTasks)
          ..remove(event.task)
          ..insert(taskIndex, event.task.copyWith(isFavorite: false));
        favoriteTasks.remove(event.task);
      }
    }

    emit(TasksState(
      pendingTasks: pendingTasks,
      completedTasks: completedTasks,
      favoriteTasks: favoriteTasks,
      removedTasks: state.removedTasks,
    ));
  }

//https://youtu.be/PD0eAXLd5ls?t=7100
  void _onEditTask(EditTask event, Emitter<TasksState> emit) {
    final state = this.state;

    List<Task> favouriteTasks = state.favoriteTasks;

    if (event.oldTask.isFavorite == true) {
      favouriteTasks
        ..remove(event.oldTask)
        ..insert(0, event.newTask);
    }
    emit(
      TasksState(
        pendingTasks: List.from(state.pendingTasks)
          ..remove(event.oldTask)
          ..insert(0, event.newTask),
        completedTasks: state.completedTasks..remove(event.oldTask),
        favoriteTasks: favouriteTasks,
        removedTasks: state.removedTasks,
      ),
    );
  }

  void _onRestoreTask(RestoreTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
        removedTasks: List.from(state.removedTasks)..remove(event.task),
        pendingTasks: List.from(state.pendingTasks)
          ..insert(
              0,
              event.task.copyWith(
                  isDeleted: false, isDone: false, isFavorite: false)),
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
      ),
    );
  }

  void _onDeleteAllTasks(DeleteAllTasks event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(
      TasksState(
        removedTasks: List.from(state.removedTasks)..clear(),
        pendingTasks: state.pendingTasks,
        completedTasks: state.completedTasks,
        favoriteTasks: state.favoriteTasks,
      ),
    );
  }
}// end of bloc
