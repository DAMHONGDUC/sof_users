import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomRouter {
  final String _location;
  final String _path;

  CustomRouter({required String location, required String path})
      : _location = location,
        _path = path;

  String get location => _location;

  String get path => _path;
}

class AppRouter {
  // root
  static final CustomRouter LANDING = CustomRouter(location: "/", path: "/");

  //home
  static final CustomRouter HOME =
      CustomRouter(location: "/home", path: "/home");
  static final CustomRouter USER_DETAIL =
      CustomRouter(location: "/home/user_detail", path: "user_detail");

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }
}
