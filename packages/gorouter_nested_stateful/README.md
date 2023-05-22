<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

TODO: Put a short description of the package here that helps potential users
know whether this package might be useful for them.

## Features

TODO: List what your package can do. Maybe include images, gifs, or videos.

## Getting started

TODO: List prerequisites and provide or point to information on how to
start using the package.

## Usage

See 

```dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter_nested_stateful/gorouter_nested_stateful.dart';

final GlobalKey<NavigatorState> _sectionANavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'sectionANav');
final GlobalKey<NavigatorState> _sectionBNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'sectionBNav');
final GlobalKey<NavigatorState> _sectionCNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'sectionCNav');

void main() {
  runApp(NestedTabNavigationExampleApp());
}

/// An example demonstrating how to use nested navigators
class NestedTabNavigationExampleApp extends StatelessWidget {
  /// Creates a NestedTabNavigationExampleApp
  NestedTabNavigationExampleApp({Key? key}) : super(key: key);

  static final List<ScaffoldWithNavBarTabItem> _tabs =
  <ScaffoldWithNavBarTabItem>[
    ScaffoldWithNavBarTabItem(
        rootRoutePath: '/a',
        navigatorKey: _sectionANavigatorKey,
        icon: const Icon(Icons.home),
        label: 'Section A'),
    ScaffoldWithNavBarTabItem(
      rootRoutePath: '/b',
      navigatorKey: _sectionBNavigatorKey,
      icon: const Icon(Icons.settings),
      label: 'Section B',
    ),
    ScaffoldWithNavBarTabItem(
      rootRoutePath: '/c',
      navigatorKey: _sectionCNavigatorKey,
      icon: const Icon(Icons.settings),
      label: 'Section C',
    ),
  ];

  final GoRouter _router = GoRouter(
    initialLocation: '/a',
    routes: <RouteBase>[
      /// Custom top shell route - wraps the below routes in a scaffold with
      /// a bottom tab navigator (ScaffoldWithNavBar). Note that no Navigator
      /// will be created by this top ShellRoute.
      BottomTabBarShellRoute(
        tabs: _tabs,
        routes: <RouteBase>[
          /// The screen to display as the root in the first tab of the bottom
          /// navigation bar.
          GoRoute(
            path: '/a',
            builder: (BuildContext context, GoRouterState state) =>
            const RootScreen(label: 'A', detailsPath: '/a/details'),
            routes: <RouteBase>[
              /// The details screen to display stacked on navigator of the
              /// first tab. This will cover screen A but not the application
              /// shell (bottom navigation bar).
              GoRoute(
                path: 'details',
                builder: (BuildContext context, GoRouterState state) =>
                const DetailsScreen(label: 'A'),
              ),
            ],
          ),

          /// The screen to display as the root in the second tab of the bottom
          /// navigation bar.
          GoRoute(
            path: '/b',
            builder: (BuildContext context, GoRouterState state) =>
            const RootScreen(
                label: 'B',
                detailsPath: '/b/details/1',
                detailsPath2: '/b/details/2'),
            routes: <RouteBase>[
              /// The details screen to display stacked on navigator of the
              /// second tab. This will cover screen B but not the application
              /// shell (bottom navigation bar).
              GoRoute(
                path: 'details/:param',
                builder: (BuildContext context, GoRouterState state) =>
                    DetailsScreen(label: 'B', param: state.params['param']),
              ),
            ],
          ),
          GoRoute(
            path: '/c',
            builder: (BuildContext context, GoRouterState state) =>
            const RootScreen(
                label: 'C',
                detailsPath: '/c/details/1',
                detailsPath2: '/c/details/2'),
            routes: <RouteBase>[
              /// The details screen to display stacked on navigator of the
              /// second tab. This will cover screen B but not the application
              /// shell (bottom navigation bar).
              GoRoute(
                path: 'details/:param',
                builder: (BuildContext context, GoRouterState state) =>
                    DetailsScreen(label: 'C', param: state.params['param']),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}

/// Widget for the root/initial pages in the bottom navigation bar.
class RootScreen extends StatelessWidget {
  /// Creates a RootScreen
  const RootScreen(
      {required this.label,
        required this.detailsPath,
        this.detailsPath2,
        Key? key})
      : super(key: key);

  /// The label
  final String label;

  /// The path to the detail page
  final String detailsPath;

  /// The path to another detail page
  final String? detailsPath2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tab root - $label'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Screen $label',
                style: Theme.of(context).textTheme.titleLarge),
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () {
                GoRouter.of(context).go(detailsPath);
              },
              child: const Text('View details'),
            ),
            const Padding(padding: EdgeInsets.all(4)),
            if (detailsPath2 != null)
              TextButton(
                onPressed: () {
                  GoRouter.of(context).go(detailsPath2!);
                },
                child: const Text('View more details'),
              ),
          ],
        ),
      ),
    );
  }
}

/// The details screen for either the A or B screen.
class DetailsScreen extends StatefulWidget {
  /// Constructs a [DetailsScreen].
  const DetailsScreen({
    required this.label,
    this.param,
    Key? key,
  }) : super(key: key);

  /// The label to display in the center of the screen.
  final String label;

  final String? param;

  @override
  State<StatefulWidget> createState() => DetailsScreenState();
}

/// The state for DetailsScreen
class DetailsScreenState extends State<DetailsScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Screen - ${widget.label}'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (widget.param != null)
              Text('Parameter: ${widget.param!}',
                  style: Theme.of(context).textTheme.titleLarge),
            const Padding(padding: EdgeInsets.all(4)),
            Text('Details for ${widget.label} - Counter: $_counter',
                style: Theme.of(context).textTheme.titleLarge),
            const Padding(padding: EdgeInsets.all(4)),
            TextButton(
              onPressed: () {
                setState(() {
                  _counter++;
                });
              },
              child: const Text('Increment counter'),
            ),
          ],
        ),
      ),
    );
  }
}

```

## Additional information

