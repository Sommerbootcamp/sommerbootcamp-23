import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/domain/models/application_routes.dart';
import '../data.dart';
import '../domain.dart';
import '../shared.dart';

/// Score Feature Providers
class ScoreProviders {
  // Data
  /// Score Remote Datasource
  static final Provider<ScoreDatasource> scoreRemoteDatasource =
      Provider((ref) => ScoreRemoteDatasource());

  // Domain
  /// Score Repository
  static final Provider<ScoreRepository> scoreRepository =
      Provider((ref) => ScoreRepositoryImpl());

  // Presentation

  // shared
  /// Score Feature Routes
  static final Provider<ApplicationRoutes> routes = Provider<ScoreRoutes>(
    (ref) => ScoreRoutes(),
  );
}
