import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
//https://youtu.be/PD0eAXLd5ls?t=450

// ignore: must_be_immutable
class Task extends Equatable {
  final String title;
  //https://youtu.be/PD0eAXLd5ls?t=5719
  final String description;
  //https://youtu.be/PD0eAXLd5ls?t=2362
  final String id;
  bool? isDone;
  bool? isDeleted;
  //https://youtu.be/PD0eAXLd5ls?t=6668
  final String date;
  //https://youtu.be/PD0eAXLd5ls?t=6755
  bool? isFavorite;

  Task({
    required this.title,
    required this.description,
    required this.date,
    required this.id,
    this.isDone,
    this.isDeleted,
    this.isFavorite,
  }) {
    isDone = isDone ?? false;
    isDeleted = isDeleted ?? false;
    isFavorite = isDeleted ?? false;
  }

//copy with
  Task copyWith({
    String? title,
    String? description,
    String? date,
    String? id,
    bool? isDone,
    bool? isFavorite,
    bool? isDeleted,
  }) {
    return Task(
      title: title ?? this.title,
      date: date ?? this.date,
      description: description ?? this.description,
      id: id ?? this.id,
      isDone: isDone ?? this.isDone,
      isFavorite: isFavorite ?? this.isFavorite,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  //JSON serialization

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'date': date,
      'description': description,
      'id': id,
      'isDone': isDone,
      'isFavorite': isFavorite,
      'isDeleted': isDeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] as String,
      date: map['date'] as String,
      description: map['description'] as String,
      id: map['id'] as String,
      isDone: map['isDone'] != null ? map['isDone'] as bool : null,
      isDeleted: map['isDeleted'] != null ? map['isDeleted'] as bool : null,
      isFavorite: map['isFavorite'] != null ? map['isFavorite'] as bool : null,
    );
  }

  @override
  List<Object?> get props => [
        title,
        date,
        description,
        id,
        isDeleted,
        isDone,
        isFavorite,
      ];
}
