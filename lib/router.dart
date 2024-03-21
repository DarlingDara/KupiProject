import 'package:dex_pr/main.dart';
import 'package:dex_pr/register_login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const MyHomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'autorise',
          builder: (BuildContext context, GoRouterState state) {
            return const EntryRegister();
          },
        ),
      ],
    ),
  ],
);