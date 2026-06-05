import 'package:flutter_test/flutter_test.dart';

import 'package:todo_app/features/todo/domain/todo_model.dart';

void main() {
  group('Todo model', () {
    test('creates with auto-generated id and createdAt', () {
      final todo = Todo(title: 'Test');

      expect(todo.id, isNotEmpty);
      expect(todo.title, 'Test');
      expect(todo.description, '');
      expect(todo.isCompleted, false);
      expect(todo.createdAt, isA<DateTime>());
    });

    test('copyWith replaces only specified fields', () {
      final original = Todo(title: 'Original', description: 'Desc');
      final updated = original.copyWith(title: 'Updated');

      expect(updated.title, 'Updated');
      expect(updated.description, 'Desc');
      expect(updated.id, original.id);
      expect(updated.createdAt, original.createdAt);
    });

    test('equality is based on id', () {
      final a = Todo(id: 'same-id', title: 'A');
      final b = Todo(id: 'same-id', title: 'B');
      final c = Todo(id: 'different-id', title: 'A');

      expect(a, equals(b));
      expect(a, isNot(equals(c)));
    });

    test('hashCode is based on id', () {
      final a = Todo(id: 'same-id', title: 'A');
      final b = Todo(id: 'same-id', title: 'B');

      expect(a.hashCode, b.hashCode);
    });
  });
}
