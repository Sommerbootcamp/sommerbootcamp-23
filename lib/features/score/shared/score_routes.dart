import 'package:go_router/go_router.dart';

import '../../core/domain.dart';
import '../presentation.dart';

/// Score Routes
class ScoreRoutes extends ApplicationRoutes {
  @override
  List<GoRoute> get routes => [
        GoRoute(
          path: '/score',
          pageBuilder: (_, __) => getPage(const ScorePage()),
        ),
      ];
}
