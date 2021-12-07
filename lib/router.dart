import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_gorouter/presentation/create_screen.dart';
import 'package:todo_gorouter/presentation/deleted_screen.dart';
import 'package:todo_gorouter/presentation/detail_screen.dart';
import 'package:todo_gorouter/presentation/error_screen.dart';
import 'package:todo_gorouter/presentation/home_screen.dart';
import 'package:todo_gorouter/state/auth_state.dart';
import 'package:todo_gorouter/utils/constants.dart';

import 'presentation/login_screen.dart';

class AppRouter {
  final AuthState authState;

  AppRouter(this.authState);

  late final router = GoRouter(
    refreshListenable: authState,
    debugLogDiagnostics: true,
    urlPathStrategy: UrlPathStrategy.path,
    routes: [
      GoRoute(
        name: initial,
        path: '/',
        redirect: (state) =>
            state.namedLocation(home, params: {'tab': 'pending'}),
      ),
      GoRoute(
        name: login,
        path: '/login',
        pageBuilder: (context, state) {
          return MaterialPage<void>(
            key: state.pageKey,
            child: const LoginScreen(),
          );
        },
      ),
      GoRoute(
        name: home,
        path: '/home/:tab(pending|completed)',
        pageBuilder: (context, state) {
          final String? tab = state.params['tab'];
          return MaterialPage<void>(
            key: state.pageKey,
            child: HomeScreen(tab: tab!),
          );
        },
      ),
      GoRoute(
        name: create,
        path: '/create',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: const CreateScreen(),
        ),
      ),
      GoRoute(
        name: pending,
        path: '/pending',
        redirect: (state) =>
            state.namedLocation(home, params: {'tab': 'pending'}),
      ),
      GoRoute(
        name: completed,
        path: '/completed',
        redirect: (state) =>
            state.namedLocation(home, params: {'tab': 'completed'}),
      ),
      GoRoute(
        name: detail,
        path: '/detail/:id',
        pageBuilder: (context, state) => MaterialPage<void>(
          key: state.pageKey,
          child: DetailScreen(
            id: state.params['id']!,
          ),
        ),
      ),
      // sub-route
      GoRoute(
          name: homePending,
          path: '/home',
          pageBuilder: (context, state) => MaterialPage<void>(
                key: state.pageKey,
                child: HomeScreen(
                  tab: 'pending',
                ),
              ),
          routes: [
            GoRoute(
              name: deleted,
              path: 'deleted',
              pageBuilder: (context, state) => MaterialPage<void>(
                key: state.pageKey,
                child: const DeletedScreen(),
              ),
            ),
          ]),
    ],
    errorPageBuilder: (context, state) => MaterialPage<void>(
      key: state.pageKey,
      child: ErrorScreen(
        message: state.error.toString(),
      ),
    ),
    redirect: (state) {
      final loggedIn = authState.isAuthenticated;
      final goingToLogin = state.location == '/login';

      // the user is not logged in and not headed to /login, they need to login
      if (!loggedIn && !goingToLogin) return '/login';

      // the user is logged in and headed to /login, no need to login again
      if (loggedIn && goingToLogin) return '/';

      // no need to redirect at all
      return null;
    },
  );
}
