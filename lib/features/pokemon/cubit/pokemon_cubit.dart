import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pokedex/core/dependency_injection/dependency_injection.dart';
import 'package:pokedex/core/services/services.dart';
import 'package:pokedex/features/pokemon/pokemon.dart';

part 'pokemon_state.dart';

/// A [Cubit] for managing the state of Pokémon-related operations.
///
/// This class handles the initialization, data fetching, and error handling
/// for the Pokémon feature of the application.
class PokemonCubit extends Cubit<PokemonState> {
  /// Creates a new instance of [PokemonCubit] with an initial state.
  PokemonCubit() : super(PokemonState.initial());

  /// Initializes the Pokémon feature by fetching and storing Pokémon data.
  ///
  /// - First, it fetches Pokémon data from the local storage.
  /// - If the local storage is empty, it retrieves data from the remote API
  ///   and stores it locally.
  /// - Updates the state with the Pokémon data or handles errors if they occur.
  Future<void> initialize() async {
    log.i("(PokemonCubit) Initialization started.");
    emit(state.copyWith(isLoading: true));

    try {
      final pokemonLocalService = serviceLocator<PokemonLocalService>();
      final pokemonService = serviceLocator<PokemonService>();

      // Fetch Pokémon from local storage.
      final pokemon = await pokemonLocalService.fetchAllPokemon();

      // Fetch and store Pokémon from the remote API if local storage is empty.
      if (pokemon.isEmpty) {
        await pokemonService.fetchAndStoreAllPokemon();
      }

      // Update the state with the fetched Pokémon data.
      emit(state.copyWith(pokemon: pokemon, isLoading: false));
      log.f("(PokemonCubit) Loaded Pokémon: ${state.pokemon}");
    } catch (e) {
      _handleError(e);
    }

    log.i("(PokemonCubit) Initialization finished.");
  }

  /// Handles errors by logging the error and updating the state with an error message.
  ///
  /// - [e]: The error object to handle.
  void _handleError(dynamic e) {
    log.e('(PokemonCubit) Error occurred: $e');
    emit(state.copyWith(isLoading: false, error: 'Error occurred: $e'));
  }
}
