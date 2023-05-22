import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter_nested_stateful/src/scaffold_with_navbar.dart';

import 'scaffold_with_navbar_tabitem.dart';

/// ShellRoute that uses a bottom tab navigation (ScaffoldWithNavBar) with
/// separate navigators for each tab.
///
/// NOTE: This is not an optimal implementation and should ideally be
/// implemented in go_router, although in a way that doesn't use a navigator.
/// Here is a proposed implementation:
/// https://github.com/tolo/flutter_packages/tree/nested-persistent-navigation/packages/go_router
class BottomTabBarShellRoute extends ShellRoute {
  final List<ScaffoldWithNavBarTabItem> tabs;
  BottomTabBarShellRoute({
    required this.tabs,
    GlobalKey<NavigatorState>? navigatorKey,
    List<RouteBase> routes = const <RouteBase>[],
    Key? scaffoldKey = const ValueKey('ScaffoldWithNavBar'),
  }) : super(
            navigatorKey: navigatorKey,
            routes: routes,
            builder: (context, state, Widget fauxNav) {
              late Navigator navigator;
              if (fauxNav is HeroControllerScope) {
                navigator = fauxNav.child as Navigator;
              } else {
                navigator = fauxNav as Navigator;
              }

              return Stack(children: [
                // Needed to keep the (faux) shell navigator alive
                Offstage(child: fauxNav),
                ScaffoldWithNavBar(
                    tabs: tabs,
                    key: scaffoldKey,
                    currentNavigator: navigator,
                    currentRouterState: state,
                    routes: routes),
              ]);
            });
}
