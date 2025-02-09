import 'package:pokedex/core/constants/constants.dart';
import 'package:pokedex/core/network/network.dart';
import 'package:pokedex/core/services/services.dart';
import 'package:pokedex/features/pokemon/pokemon.dart';

/// Service responsible for fetching Pokemon data from the API
/// and storing it locally using [PokemonLocalService].
class PokemonService {
  final DioClient _dio;
  final PokemonLocalService _localService;

  /// Constructs a [PokemonService] with a [DioClient] for API calls
  /// and a [PokemonLocalService] for local data storage.
  PokemonService({
    required DioClient dioClient,
    required PokemonLocalService pokemonLocalService,
  })  : _dio = dioClient,
        _localService = pokemonLocalService;

  /// Fetches Pokemon data from the API by iterating through Pokemon IDs
  /// and stores the data locally using [PokemonLocalService].
  ///
  /// The function fetches Pokemon with IDs ranging from 1 to 21.
  Future<void> fetchAndStoreAllPokemon() async {
    try {
      final futures = List.generate(21, (id) async {
        final response = await _dio.get('${ApiUrls.fetchPokemon}${id + 1}');
        final pokemon = Pokemon.fromJson(response.data);
        await _localService.savePokemon(pokemon);
      });
      await Future.wait(futures);
    } catch (e) {
      log.e("(Pokemon Service) Error fetching Pokemon: $e");
      rethrow;
    }
  }
}
