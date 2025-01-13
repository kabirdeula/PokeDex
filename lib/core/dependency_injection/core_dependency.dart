import 'package:dio/dio.dart';
import 'package:pokedex/core/constants/constants.dart';

import 'dependency_injection.dart';

/// Registers all core dependencies required throughout the app.
/// Core dependencies typically include utilities like Dio or logging services.
void setupCoreDependencies() {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiUrls.baseUrl,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
    ),
  );

  serviceLocator.registerLazySingleton<Dio>(() => dio);
}
