/// A centralized class containing API endpoint URLs for the application.
/// This class helps maintain consistency and avoids hardcoding URLs throughout the app.
class ApiUrls {
  /// The base URL for the PokeAPI.
  static String baseUrl = "https://pokeapi.co/api/v2/";

  /// Endpoint for fetching Pokemon details
  static String fetchPokemon = "${baseUrl}pokemon/";
}
