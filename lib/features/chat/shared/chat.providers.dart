import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/domain/models/application_routes.dart';
import '../data.dart';
import '../domain.dart';
import '../shared.dart';

/// Chat Feature Provider
class ChatProviders {
  // Data
  ///Chat Remote Datasource
  static final Provider<ChatDatasource> chatRemoteDatasource =
      Provider((ref) => ChatRemoteDatasource());

  // Domain
  /// Chat Repository
  static final Provider<ChatRepository> chatRepository =
      Provider((ref) => ChatRepositoryImpl());

  // Presentation

  // shared
  /// Chat Feature Routes
  static final Provider<ApplicationRoutes> routes = Provider<ChatRoutes>(
    (ref) => ChatRoutes(),
  );
}
