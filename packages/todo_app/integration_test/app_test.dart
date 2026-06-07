import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:integration_test/integration_test.dart';
import 'package:todo_app/main.dart';
import 'package:ui_elements/ui_elements.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Todo App E2E Integration Tests', () {
    testWidgets(
        'full flow: verify empty state -> add task with validation -> edit task -> remove task',
        (tester) async {
      // 1. Launch the app
      await tester.pumpWidget(const ProviderScope(child: TodoApp()));
      await tester.pumpAndSettle();

      // 2. Verify empty state
      expect(find.text('No tasks yet!'), findsOneWidget);

      // 3. Tap bottom "Add To-Do" button to navigate to Add screen
      await tester.tap(find.text('Add To-Do'));
      await tester.pumpAndSettle();

      // Verify we are on Add screen
      expect(find.text('Add To-Do'),
          findsWidgets); // AppPageHeader title is 'Add To-Do'

      // 4. Verification that Save button starts disabled (empty title)
      var saveButton =
          tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(saveButton.onPressed, isNull);

      // 5. Validation check for title > 50 characters
      final longTitle = 'a' * 51;
      await tester.enterText(find.byType(AppTextField).first, longTitle);
      await tester.pumpAndSettle();

      // Save button should still be disabled
      saveButton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(saveButton.onPressed, isNull);
      // Validation warning text should be present
      expect(find.text('Title cannot exceed 50 characters (51/50)'),
          findsOneWidget);

      // 6. Enter valid title and description
      await tester.enterText(find.byType(AppTextField).first, 'E2E Test Task');
      await tester.enterText(find.byType(AppTextField).last, 'E2E Description');
      await tester.pumpAndSettle();

      // Save button should now be enabled
      saveButton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(saveButton.onPressed, isNotNull);

      // 7. Save task
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle(); // Navigate back to Home

      // 8. Verify list view has the added task
      expect(find.text('E2E Test Task'), findsOneWidget);
      expect(find.text('E2E Description'), findsOneWidget);

      // 9. Tap the task to edit it
      await tester.tap(find.text('E2E Test Task'));
      await tester.pumpAndSettle();

      // Verify we are on Edit screen and fields are prefilled
      expect(find.text('Edit To-Do'),
          findsWidgets); // AppPageHeader title is 'Edit To-Do'

      final titleFieldFinder = find.byType(TextField).first;
      final descFieldFinder = find.byType(TextField).last;

      expect(tester.widget<TextField>(titleFieldFinder).controller?.text,
          'E2E Test Task');
      expect(tester.widget<TextField>(descFieldFinder).controller?.text,
          'E2E Description');

      // Edit the title
      await tester.enterText(
          find.byType(AppTextField).first, 'E2E Test Task Edited');
      await tester.pumpAndSettle();

      // Save the edited task
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle(); // Navigate back to Home

      // Verify item title is updated on home
      expect(find.text('E2E Test Task Edited'), findsOneWidget);
      expect(find.text('E2E Description'), findsOneWidget);

      // 10. Remove the task
      await tester.tap(find.text('Remove'));
      await tester.pumpAndSettle();

      // 11. Verify empty state again
      expect(find.text('No tasks yet!'), findsOneWidget);
      expect(find.text('E2E Test Task Edited'), findsNothing);
    });
  });
}
