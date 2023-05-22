import 'package:go_router/go_router.dart';

import '../../core/domain.dart';
import '../presentation.dart';

/// Chat Feature Routes
class ChatRoutes extends ApplicationRoutes {
  @override
  List<GoRoute> get routes => [
        GoRoute(
          path: '/chat',
          pageBuilder: (_, __) => getPage(const ChatPage()),
        ),
      ];
}
