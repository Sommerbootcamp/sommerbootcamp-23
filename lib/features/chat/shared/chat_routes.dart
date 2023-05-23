import 'package:go_router/go_router.dart';

import '../../core/domain.dart';
import '../../user_profile/domain.dart';
import '../presentation.dart';
import '../presentation/widgets/chat_widget.dart';

/// Chat Feature Routes
class ChatRoutes extends ApplicationRoutes {
  @override
  List<GoRoute> get routes => [
        GoRoute(
          path: '/chat',
          pageBuilder: (_, __) => getPage(
            const ChatPage(),
          ),
          routes: [
            GoRoute(
              path: 'message',
              pageBuilder: (_, GoRouterState state) {
                return getPage(
                  ChatWidget(
                    isNewChat: state.queryParameters['new'] == 'true',
                    receiverUserId: state.queryParameters['receiverUserId']!,
                  ),
                );
              },
            ),
          ],
        ),
      ];
}
