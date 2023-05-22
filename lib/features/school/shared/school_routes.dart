import 'package:go_router/go_router.dart';

import '../../core/domain.dart';
import '../presentation.dart';

/// SchoolRoutes
class SchoolRoutes extends ApplicationRoutes {
  @override
  List<GoRoute> get routes => [
        GoRoute(
          path: '/school',
          pageBuilder: (_, __) => getPage(const SchoolPage()),
        ),
      ];
}
