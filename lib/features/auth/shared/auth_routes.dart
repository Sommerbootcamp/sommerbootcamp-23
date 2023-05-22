import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../core/domain.dart' show ApplicationRoutes;
import '../presentation/login.page.dart';

/// Routes for the auth Feature
class AuthRoutes extends ApplicationRoutes {
  @override
  List<GoRoute> get routes => [
        GoRoute(
          path: '/login',
          pageBuilder: (BuildContext context, GoRouterState state) {
            return buildPageWithDefaultTransition<LoginPage>(
              context: context,
              state: state,
              child: const LoginPage(),
            );
          },
        ),
      ];
}
