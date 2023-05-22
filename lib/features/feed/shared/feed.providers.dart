import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../auth/shared.dart';
import '../../core/domain/models/application_routes.dart';
import '../../core/shared.dart';
import '../data.dart';
import '../domain.dart';
import '../shared.dart';

/// Feed Feature Providers
class FeedProviders {
  // Data

  /// Feed Remote Datasource
  static final Provider<FeedDatasource> feedRemoteDatasource =
      Provider((ref) => FeedRemoteDatasource());

  // Domain
  /// Feed Repository
  static final Provider<FeedRepository> feedRepository = Provider(
    (ref) => FeedRepositoryImpl(
      appwriteClient: ref.read(CoreProviders.appwrite),
      authRepository: ref.read(AuthProviders.authRepository),
    ),
  );

  // Presentation

  /// get all posts
  static final FutureProvider<List<PostModel>> getAllPosts = FutureProvider(
    (ref) async => ref.watch(feedRepository).getPosts(),
  );

  // shared
  /// Feed Feature Routes
  static final Provider<ApplicationRoutes> routes = Provider<FeedRoutes>(
    (ref) => FeedRoutes(),
  );
}
