import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/todo_model.dart';

final todoListProvider =
    StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
  return TodoListNotifier();
});

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier() : super([]);

  void add(String title, {String description = ''}) {
    state = [
      ...state,
      Todo(title: title, description: description),
    ];
  }

  void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(isCompleted: !todo.isCompleted)
        else
          todo,
    ];
  }

  void remove(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }

  void edit(String id, {String? title, String? description}) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(title: title, description: description)
        else
          todo,
    ];
  }
}
