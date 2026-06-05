import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:integration_test/integration_test.dart';

import 'package:todo_app/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Todo App E2E', () {
    testWidgets('full add-check-delete flow', (tester) async {
      await tester.pumpWidget(const ProviderScope(child: TodoApp()));
      await tester.pumpAndSettle();

      // 1. Verify empty state
      expect(find.text('No tasks yet!'), findsOneWidget);

      // 2. Tap FAB to navigate to Add screen
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
      expect(find.text('Add To-Do'), findsOneWidget);

      // 3. Enter title and save
      await tester.enterText(
        find.byType(TextField).first,
        'Integration Test Task',
      );
      await tester.tap(find.text('Add Task'));
      await tester.pumpAndSettle();

      // 4. Verify item appears on home screen
      expect(find.text('Integration Test Task'), findsOneWidget);
      expect(find.text('No tasks yet!'), findsNothing);

      // 5. Toggle completion via checkbox
      await tester.tap(find.byType(Checkbox));
      await tester.pumpAndSettle();

      // 6. Delete the item
      await tester.tap(find.byIcon(Icons.delete_outline));
      await tester.pumpAndSettle();

      // 7. Verify empty state again
      expect(find.text('No tasks yet!'), findsOneWidget);
    });
  });
}
