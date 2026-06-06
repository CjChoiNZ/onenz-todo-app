import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_elements/ui_elements.dart';

import '../../application/todo_provider.dart';
import '../../domain/todo_model.dart';

class AddTodoScreen extends ConsumerStatefulWidget {
  const AddTodoScreen({super.key, this.editTodo});

  final Todo? editTodo;

  @override
  ConsumerState<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends ConsumerState<AddTodoScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;

  bool get _isEditing => widget.editTodo != null;

  @override
  void initState() {
    super.initState();
    _titleController =
        TextEditingController(text: widget.editTodo?.title ?? '');
    _descriptionController =
        TextEditingController(text: widget.editTodo?.description ?? '');
    _titleController.addListener(_onTitleChanged);
  }

  void _onTitleChanged() {
    setState(() {});
  }

  @override
  void dispose() {
    _titleController.removeListener(_onTitleChanged);
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  bool get _isTitleValid {
    final text = _titleController.text.trim();
    return text.isNotEmpty && text.length <= 50;
  }

  void _submit() {
    if (!_isTitleValid) return;
    final title = _titleController.text.trim();

    if (_isEditing) {
      ref.read(todoListProvider.notifier).edit(
            widget.editTodo!.id,
            title: title,
            description: _descriptionController.text.trim(),
          );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Task updated successfully'),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          duration: const Duration(seconds: 2),
        ),
      );
    } else {
      ref.read(todoListProvider.notifier).add(
            title,
            description: _descriptionController.text.trim(),
          );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Task added successfully'),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          duration: const Duration(seconds: 2),
        ),
      );
    }

    context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppPageHeader(
        title: _isEditing ? 'Edit To-Do' : 'Add To-Do',
        showBackButton: true,
        onBackPressed: () => context.pop(),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
          child: AppButton(
            label: 'Save',
            onPressed: _isTitleValid ? _submit : null,
            backgroundColor: const Color(0xFF007AFF),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppTextField(
              hintText: 'Title',
              controller: _titleController,
              autofocus: true,
              onSubmitted: (_) {
                if (_isTitleValid) _submit();
              },
            ),
            if (_titleController.text.trim().length > 50)
              Padding(
                padding: const EdgeInsets.only(top: 6, left: 4),
                child: Text(
                  'Title cannot exceed 50 characters (${_titleController.text.trim().length}/50)',
                  style: const TextStyle(color: Colors.red, fontSize: 13),
                ),
              ),
            const SizedBox(height: 16),
            AppTextField(
              hintText: 'Description',
              controller: _descriptionController,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
