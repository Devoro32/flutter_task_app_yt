// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

//https://youtu.be/Qe47b8r5epc?t=282
class Todo extends Equatable {
  final String id;
  final String task;
  final String description;
  bool? isCompleted;
  bool? isCancelled;
  Todo({
    required this.id,
    required this.task,
    required this.description,
    this.isCompleted,
    this.isCancelled,
  }) {
    isCancelled = isCancelled ?? false;
    isCompleted = isCompleted ?? false;
  }

//Update the todo list

  Todo copyWith({
    String? id,
    String? task,
    String? description,
    bool? isCompleted,
    bool? isCancelled,
  }) {
    return Todo(
      id: id ?? this.id,
      task: task ?? this.task,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
      isCancelled: isCancelled ?? this.isCancelled,
    );
  }

  @override
  List<Object?> get props => [
        id,
        task,
        description,
        isCompleted,
        isCancelled,
      ];

  static List<Todo> todos = [
    Todo(
      id: '1',
      task: 'Sample Todo 1',
      description: 'this is a test to do',
    ),
    Todo(
      id: '2',
      task: 'Sample Todo 2',
      description: 'this is a test to do',
    ),
    Todo(
      id: '3',
      task: 'Sample Todo 3',
      description: 'this is a test to do',
    ),
    Todo(
      id: '4',
      task: 'Sample Todo 4',
      description: 'this is a test to do',
    ),
  ];
}
