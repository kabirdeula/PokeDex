import 'package:pokedex/features/pokemon/pokemon.dart';

import 'dependency_injection.dart';

void setupCubitDependencies() {
  serviceLocator.registerFactory(() => PokemonCubit());
}
