import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/todo_model.dart';

/// Provides the list of [Todo] items.
///
/// Uses a [StateNotifier] so mutations are explicit
/// and the UI rebuilds predictably.
final todoListProvider =
    StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
  return TodoListNotifier();
});

/// Manages the to-do list state.
class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier() : super([]);

  /// Add a new to-do.
  void add(String title, {String description = ''}) {
    state = [
      ...state,
      Todo(title: title, description: description),
    ];
  }

  /// Toggle the completion status of a to-do.
  void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          todo.copyWith(isCompleted: !todo.isCompleted)
        else
          todo,
    ];
  }

  /// Remove a to-do by id.
  void remove(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }

  /// Edit the title and description of a to-do.
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
