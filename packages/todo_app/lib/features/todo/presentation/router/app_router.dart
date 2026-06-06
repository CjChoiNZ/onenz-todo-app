import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../screens/home_screen.dart';
import '../screens/add_todo_screen.dart';
import '../../domain/todo_model.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/add',
        name: 'add',
        builder: (context, state) => AddTodoScreen(
          editTodo: state.extra as Todo?,
        ),
      ),
    ],
  );
});
