import 'package:flutter_test/flutter_test.dart';

import 'package:todo_app/features/todo/application/todo_provider.dart';

void main() {
  late TodoListNotifier notifier;

  setUp(() {
    notifier = TodoListNotifier();
  });

  group('TodoListNotifier', () {
    test('starts with empty list', () {
      expect(notifier.state, isEmpty);
    });

    test('add() appends a new todo', () {
      notifier.add('Buy milk');

      expect(notifier.state.length, 1);
      expect(notifier.state.first.title, 'Buy milk');
      expect(notifier.state.first.isCompleted, false);
    });

    test('add() with description', () {
      notifier.add('Buy milk', description: 'From the store');

      expect(notifier.state.first.description, 'From the store');
    });

    test('toggle() flips isCompleted', () {
      notifier.add('Task');
      final id = notifier.state.first.id;

      notifier.toggle(id);
      expect(notifier.state.first.isCompleted, true);

      notifier.toggle(id);
      expect(notifier.state.first.isCompleted, false);
    });

    test('remove() deletes the todo', () {
      notifier.add('Task 1');
      notifier.add('Task 2');
      final idToRemove = notifier.state.first.id;

      notifier.remove(idToRemove);

      expect(notifier.state.length, 1);
      expect(notifier.state.first.title, 'Task 2');
    });

    test('edit() updates title and description', () {
      notifier.add('Old title', description: 'Old desc');
      final id = notifier.state.first.id;

      notifier.edit(id, title: 'New title', description: 'New desc');

      expect(notifier.state.first.title, 'New title');
      expect(notifier.state.first.description, 'New desc');
    });

    test('edit() updates only specified fields', () {
      notifier.add('Title', description: 'Desc');
      final id = notifier.state.first.id;

      notifier.edit(id, title: 'Updated');

      expect(notifier.state.first.title, 'Updated');
      expect(notifier.state.first.description, 'Desc');
    });
  });
}
