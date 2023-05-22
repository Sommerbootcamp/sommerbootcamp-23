import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/domain/models/application_routes.dart';
import '../data.dart';
import '../domain.dart';
import '../shared.dart';

/// School Feature Provider
class SchoolProviders {
  // Data

  /// Remote Datasource
  static final Provider<SchoolDatasource> schoolRemoteDatasource =
      Provider((ref) => SchoolRemoteDatasource());

  // Domain
  /// School Repositoy
  static final Provider<SchoolRepository> schoolRepository =
      Provider((ref) => SchoolRepositoryImpl());

  // Presentation

  // shared
  /// School Feature Routes
  static final Provider<ApplicationRoutes> routes = Provider<SchoolRoutes>(
    (ref) => SchoolRoutes(),
  );
}
