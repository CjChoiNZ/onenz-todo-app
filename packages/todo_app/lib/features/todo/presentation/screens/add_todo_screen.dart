import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_elements/ui_elements.dart';

import '../../application/todo_provider.dart';

/// Screen for adding a new to-do item.
class AddTodoScreen extends ConsumerStatefulWidget {
  const AddTodoScreen({super.key});

  @override
  ConsumerState<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends ConsumerState<AddTodoScreen> {
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _submit() {
    final title = _titleController.text.trim();
    if (title.isEmpty) return;

    ref.read(todoListProvider.notifier).add(
          title,
          description: _descriptionController.text.trim(),
        );

    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add To-Do')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextField(
              hintText: 'What needs to be done?',
              controller: _titleController,
              autofocus: true,
              prefixIcon: Icons.title,
              onSubmitted: (_) => _submit(),
            ),
            const SizedBox(height: 16),
            AppTextField(
              hintText: 'Add a description (optional)',
              controller: _descriptionController,
              prefixIcon: Icons.notes,
              maxLines: 3,
            ),
            const SizedBox(height: 32),
            AppButton(
              label: 'Add Task',
              onPressed: _submit,
            ),
          ],
        ),
      ),
    );
  }
}
