import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter_nested_stateful/gorouter_nested_stateful.dart';

import 'app_theme.dart';
import 'features/auth/shared.dart';
import 'features/chat/shared.dart';
import 'features/core/shared.dart';
import 'features/feed/shared.dart';
import 'features/school/shared.dart';
import 'features/score/shared.dart';
import 'features/settings/shared.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MainApp()));
}

/// Main Application Widget
class MainApp extends ConsumerWidget {
  /// constructor
  MainApp({super.key});

  final GlobalKey<NavigatorState> _homeNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'homeNavigatorKey');

  final GlobalKey<NavigatorState> _schoolNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'schoolNavigatorKey');

  final GlobalKey<NavigatorState> _chatNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'chatNavigatorKey');

  final GlobalKey<NavigatorState> _scoreNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'scoreNavigatorKey');

  final GlobalKey<NavigatorState> _settingsNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'settingsNavigatorKey');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Bottom Nav Bar Items
    final navBarItems = [
      ScaffoldWithNavBarTabItem(
        navigatorKey: _homeNavigatorKey,
        rootRoutePath: '/feed',
        icon: const Icon(Icons.home),
        label: 'Home',
      ),
      ScaffoldWithNavBarTabItem(
        navigatorKey: _schoolNavigatorKey,
        rootRoutePath: '/school',
        icon: const Icon(Icons.school),
        label: 'School',
      ),
      ScaffoldWithNavBarTabItem(
        navigatorKey: _chatNavigatorKey,
        rootRoutePath: '/chat',
        icon: const Icon(Icons.chat),
        label: 'Chat',
      ),
      ScaffoldWithNavBarTabItem(
        navigatorKey: _scoreNavigatorKey,
        rootRoutePath: '/score',
        icon: const Icon(Icons.scoreboard),
        label: 'Score',
      ),
      ScaffoldWithNavBarTabItem(
        navigatorKey: _settingsNavigatorKey,
        rootRoutePath: '/settings',
        icon: const Icon(Icons.settings),
        label: 'Settings',
      ),
    ];

    final authRedirectService = ref.read(AuthProviders.authRedirectService);

    final appRouteService = ref.read(CoreProviders.appRouterService)
      ..addRoutes(
        routes: [
          GoRoute(path: '/', redirect: (_, __) => '/feed'),
        ],
      )
      ..addRouteConfigurations(
        routeConfigurations: [
          ref.read(AuthProviders.routes),
          ref.read(FeedProviders.routes),
          ref.read(SchoolProviders.routes),
          ref.read(ChatProviders.routes),
          ref.read(ScoreProviders.routes),
          ref.read(SettingsProviders.routes),
        ],
      )
      ..setRefreshListenable(ref.watch(AuthProviders.authStateNotifier))
      ..setRedirect(authRedirectService.redirect);

    return MaterialApp.router(
      title: "Sommerbootcamp '23",
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: appRouteService.bottomTabBarShellRouter(navBarItems),
    );
  }
}
