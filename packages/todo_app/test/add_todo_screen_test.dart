import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_app/features/todo/presentation/screens/add_todo_screen.dart';
import 'package:todo_app/features/todo/domain/todo_model.dart';
import 'package:ui_elements/ui_elements.dart';

void main() {
  Widget buildTestableWidget({Todo? editTodo}) {
    return ProviderScope(
      child: MaterialApp(
        home: AddTodoScreen(editTodo: editTodo),
      ),
    );
  }

  group('AddTodoScreen Widget Tests', () {
    testWidgets('Save button is disabled when title is empty', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget());
      await tester.pump();

      // Find the AppButton / ElevatedButton
      final elevatedButton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(elevatedButton.onPressed, isNull); // Disabled
    });

    testWidgets('Save button is enabled when a valid title is entered', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget());
      await tester.pump();

      // Enter a valid title
      await tester.enterText(find.byType(AppTextField).first, 'Buy milk');
      await tester.pumpAndSettle();

      final elevatedButton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(elevatedButton.onPressed, isNotNull); // Enabled
    });

    testWidgets('Save button is disabled and error message is shown when title exceeds 50 characters', (WidgetTester tester) async {
      await tester.pumpWidget(buildTestableWidget());
      await tester.pump();

      // Enter a title that is 51 characters long
      final longTitle = 'a' * 51;
      await tester.enterText(find.byType(AppTextField).first, longTitle);
      await tester.pumpAndSettle();

      // Save button should be disabled
      final elevatedButton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(elevatedButton.onPressed, isNull); // Disabled

      // Error message should be shown
      expect(find.text('Title cannot exceed 50 characters (51/50)'), findsOneWidget);
    });

    testWidgets('Pre-fills fields and enables Save button when editTodo is provided', (WidgetTester tester) async {
      final todo = Todo(title: 'Edit me', description: 'Original description');
      await tester.pumpWidget(buildTestableWidget(editTodo: todo));
      await tester.pump();

      // Check if values are prefilled
      expect(find.text('Edit me'), findsOneWidget);
      expect(find.text('Original description'), findsOneWidget);

      // Save button should be enabled by default
      final elevatedButton = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(elevatedButton.onPressed, isNotNull); // Enabled
    });
  });
}
