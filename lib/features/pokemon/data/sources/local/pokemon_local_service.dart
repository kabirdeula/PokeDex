import 'package:pokedex/core/services/services.dart';
import 'package:pokedex/core/utils/utils.dart';
import 'package:pokedex/features/pokemon/pokemon.dart';

/// Handles local storage operations for Pokemon using Hive.
class PokemonLocalService {
  late final Future<Box<Pokemon>> _pokemonBox;

  /// Initializes the [PokemonLocalService] by opening the Hive box for Pokemon.
  PokemonLocalService() {
    _pokemonBox = HiveUtil.openHiveBox<Pokemon>('pokemon');
  }

  /// Saves a [Pokemon] to the Hive box.
  ///
  /// If a Pokemon with the same ID already exists, it will be overwritten.
  Future<void> savePokemon(Pokemon pokemon) async {
    try {
      final box = await _pokemonBox;
      await box.put(pokemon.id, pokemon);
      log.i(
          "(Pokemon Local Service) Saved ${pokemon.name} (ID: ${pokemon.id}) to Hive.");
    } catch (e) {
      log.e("(Pokemon Local Service) Error saving Pokemon: $e");
    }
  }

  /// Retrieves all Pokemon stored in the Hive box.
  ///
  /// Returns a list of [Pokemon] objects.
  Future<List<Pokemon>> fetchAllPokemon() async {
    try {
      final box = await _pokemonBox;
      return box.values.toList();
    } catch (e) {
      log.e("(Pokemon Local Service) Error fetching all Pokemon: $e");
      return [];
    }
  }

  /// Retrieves a single [Pokemon] by its `id`.
  ///
  /// Returns `null` if no Pokemon with the given ID is found.
  Future<Pokemon?> fetchPokemonById(int id) async {
    try {
      final box = await _pokemonBox;
      return box.get(id);
    } catch (e) {
      log.e("(Pokemon Local Service) Error fetching Pokemon by ID: $e");
      return null;
    }
  }

  /// Deletes a [Pokemon] from the Hive box by its `id`.
  Future<void> deletePokemonById(int id) async {
    try {
      final box = await _pokemonBox;
      await box.delete(id);
      log.i("(Pokemon Local Service) Deleted Pokemon with ID: $id.");
    } catch (e) {
      log.e("(Pokemon Local Service) Error deleting Pokemon by ID: $e");
    }
  }

  /// Deletes all Pokemon stored in the Hive box.
  Future<void> clearAllPokemon() async {
    try {
      final box = await _pokemonBox;
      await box.clear();
      log.i("(Pokemon Local Service) Cleared all Pokemon data.");
    } catch (e) {
      log.e("(Pokemon Local Service) Error clearing all Pokemon: $e");
    }
  }
}
