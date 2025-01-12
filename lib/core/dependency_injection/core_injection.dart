import 'package:dio/dio.dart';
import 'package:pokedex/core/constants/constants.dart';

import 'dependency_injection.dart';

void coreInjection() {
  final dio = Dio(
    BaseOptions(
      baseUrl: ApiUrls.baseUrl,
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json"
      },
    ),
  );

  locator.registerLazySingleton<Dio>(() => dio);
}
