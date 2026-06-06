import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ui_elements/ui_elements.dart';

import '../../application/todo_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider);

    return Scaffold(
      appBar: AppPageHeader(
        title: 'Home',
        showBackButton: true,
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 16),
          child: AppButton(
            label: 'Add To-Do',
            onPressed: () => context.pushNamed('add'),
            backgroundColor: const Color(0xFF007AFF),
          ),
        ),
      ),
      body: todos.isEmpty
          ? const _EmptyState()
          : ListView.builder(
              padding: const EdgeInsets.only(top: 12, bottom: 16),
              itemCount: todos.length,
              itemBuilder: (context, index) {
                final todo = todos[index];
                return AppCard(
                  onTap: () => context.pushNamed('add', extra: todo),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             Text(
                              todo.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                                decoration: todo.isCompleted
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                            if (todo.description.isNotEmpty)
                              const SizedBox(height: 4),
                            if (todo.description.isNotEmpty)
                              Text(
                                todo.description,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 16.5,
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black,
                                ),
                              ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () => ref
                            .read(todoListProvider.notifier)
                            .remove(todo.id),
                        child: const Text(
                          'Remove',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'No tasks yet!',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(color: Colors.grey.shade500),
          ),
          const SizedBox(height: 8),
          Text(
            'Tap Add To-Do to get started.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
