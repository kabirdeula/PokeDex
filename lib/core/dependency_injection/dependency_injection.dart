import 'package:get_it/get_it.dart';

import 'core_dependency.dart';
import 'service_dependency.dart';

/// A centralized method to set up dependency injection for the entire application.
/// It initializes both core and service-level dependencies.
void setupDependencyInjection() {
  setupCoreDependencies();
  setupServiceDependencies();
}

/// The singleton instance of [GetIt] used for dependency injection.
final serviceLocator = GetIt.instance;
