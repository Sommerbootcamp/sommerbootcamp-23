import 'package:go_router/go_router.dart';

import '../../core/domain.dart';
import '../presentation.dart';

/// Settings Routes
class SettingsRoutes extends ApplicationRoutes {
  @override
  List<GoRoute> get routes => [
        GoRoute(
          path: '/settings',
          pageBuilder: (_, __) => getPage(const SettingsPage()),
        ),
      ];
}
