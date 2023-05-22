import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/domain/models/application_routes.dart';
import '../presentation.dart';
import '../presentation/widgets/add_post.dart';
import '../presentation/widgets/add_post_comment.dart';

/// Feed Feature routes
class FeedRoutes extends ApplicationRoutes {
  @override
  List<GoRoute> get routes => [
        GoRoute(
          path: '/feed',
          pageBuilder: (BuildContext context, GoRouterState state) =>
              buildPageWithDefaultTransition<FeedPage>(
            context: context,
            state: state,
            child: const FeedPage(),
          ),
          routes: [
            GoRoute(
              path: 'add',
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  buildPageWithDefaultTransition<AddPost>(
                context: context,
                state: state,
                child: const AddPost(),
              ),
              routes: [
                GoRoute(
                  path: 'comment',
                  pageBuilder: (BuildContext context, GoRouterState state) {
                    final image = (state.extra is Uint8List
                        ? state.extra
                        : null) as Uint8List?;

                    return buildPageWithDefaultTransition<AddPostComment>(
                      context: context,
                      state: state,
                      child: AddPostComment(image: image),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ];
}
