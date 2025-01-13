part of 'pokemon_cubit.dart';

class PokemonState extends Equatable {
  final bool isLoading;
  final List<Pokemon>? pokemon;
  final String? error;

  const PokemonState({
    this.isLoading = false,
    this.pokemon,
    this.error,
  });

  factory PokemonState.initial() => const PokemonState();

  PokemonState copyWith({
    bool? isLoading,
    List<Pokemon>? pokemon,
    String? error,
  }) {
    return PokemonState(
      isLoading: isLoading ?? this.isLoading,
      pokemon: pokemon ?? this.pokemon,
      error: error ?? this.error,
    );
  }

  @override
  List<Object?> get props => [isLoading, pokemon, error];
}
