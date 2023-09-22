import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Task extends Equatable {
  final String title;
  final String id;
  bool? isdone;
  bool? isdeleted;

  Task({
    required this.title,
    required this.id,
    this.isdeleted,
    this.isdone,
  }) {
    isdone = isdone ?? false;
    isdeleted = isdeleted ?? false;
  }
  Task copyWith({
    String? title,
    String? id,
    bool? isdone,
    bool? isdeleted,
  }) {
    return Task(
        title: title ?? this.title,
        id: id ?? this.id,
        isdeleted: isdeleted ?? this.isdeleted,
        isdone: isdone ?? this.isdone);
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isdone': isdone,
      'isdeleted': isdeleted,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
        title: map['title'] ?? '',
        id: map['id'] ?? '',
        isdeleted: map['isdeleted'],
        isdone: map['isdone']);
  }

  @override
  List<Object?> get props => [title, isdone, isdeleted,id];
}
