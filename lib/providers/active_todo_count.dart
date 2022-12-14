// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../models/models.dart';
import 'providers.dart';

class ActiveTodoCountState extends Equatable {
  final int activeTodoCount;

  const ActiveTodoCountState({
    required this.activeTodoCount,
  });

  factory ActiveTodoCountState.initial() {
    return const ActiveTodoCountState(activeTodoCount: 0);
  }

  @override
  List<Object> get props => [activeTodoCount];

  @override
  bool get stringify => true;

  ActiveTodoCountState copyWith({
    int? activeTodoCount,
  }) {
    return ActiveTodoCountState(
      activeTodoCount: activeTodoCount ?? this.activeTodoCount,
    );
  }
}

// class ActiveTodoCount with ChangeNotifier {
//   // ActiveTodoCountState _state = ActiveTodoCountState.initial();
//   late ActiveTodoCountState _state;
//   final int initialActiveTodoCount;
//   ActiveTodoCount({
//     required this.initialActiveTodoCount,
//   }) {
//     print("initialActiveTodoCount: $initialActiveTodoCount");
//     _state = ActiveTodoCountState(activeTodoCount: initialActiveTodoCount);
//   }
//   ActiveTodoCountState get state => _state;

//   void update(TodoList todoList) {
//     final int newActiveTodoCount = todoList.state.todos
//         .where((Todo todo) => !todo.isCompleted)
//         .toList()
//         .length;

//     _state = _state.copyWith(activeTodoCount: newActiveTodoCount);
//     notifyListeners();
//   }
// }

class ActiveTodoCount {
  final TodoList todoList;

  ActiveTodoCount({
    required this.todoList,
  });
  ActiveTodoCountState get state => ActiveTodoCountState(
        activeTodoCount: todoList.state.todos
            .where((Todo todo) => !todo.isCompleted)
            .toList()
            .length,
      );
}
