import 'package:dio/dio.dart';
import 'package:pokedex/core/network/network.dart';
import 'package:pokedex/features/pokemon/pokemon.dart';

import 'dependency_injection.dart';

/// Registers all service-layer dependencies with the `serviceLocator`.
void setupServiceDependencies() {
  // Registering DioClient with lazy initialization.
  serviceLocator.registerLazySingleton<DioClient>(
    () => DioClient(dio: serviceLocator<Dio>()),
  );

  // Registering the local data service for Pokemon-related operations.
  serviceLocator.registerLazySingleton<PokemonLocalService>(
    () => PokemonLocalService(),
  );

  // Registering the primary Pokemon service, which depends on DioClient and PokemonLocalService.
  serviceLocator.registerLazySingleton<PokemonService>(
    () => PokemonService(
      dioClient: serviceLocator<DioClient>(),
      pokemonLocalService: serviceLocator<PokemonLocalService>(),
    ),
  );
}
