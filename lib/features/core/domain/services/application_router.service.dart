import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter_nested_stateful/gorouter_nested_stateful.dart';

import '../../domain.dart';

/// Application routing Service
abstract class ApplicationRouterService {
  /// Get GoRouter instance
  GoRouter get router;

  /// Add additional Routes to GoRouter
  void addRoutes({required List<GoRoute> routes});

  /// Add route configuration from [ApplicationRoutes]
  void addRouteConfiguration({required ApplicationRoutes routeConfiguration});

  /// Add a List of Route Configurations
  void addRouteConfigurations({
    required List<ApplicationRoutes> routeConfigurations,
  });

  /// set router refresh listenable
  // ignore: use_setters_to_change_properties
  void setRefreshListenable(Listenable? listenable);

  /// set redirect function callback
  // ignore: use_setters_to_change_properties
  void setRedirect(
    FutureOr<String?> Function(BuildContext, GoRouterState)? redirect,
  );

  /// get [BottomTabBarShellRoute] routes
  GoRouter bottomTabBarShellRouter(
    List<ScaffoldWithNavBarTabItem> tabs,
  );
}
