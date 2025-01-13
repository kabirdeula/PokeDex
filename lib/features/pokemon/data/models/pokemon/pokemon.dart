import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

/// Represents a Pokemon model
///
/// - [id]: The unique identifier of the Pokemon (e.g., its Pokedex number).
/// - [name]: The name of the Pokemon.
@HiveType(typeId: 0)
@freezed
class Pokemon with _$Pokemon {
  const factory Pokemon({
    @HiveField(0) required int id,
    @HiveField(1) required String name,
  }) = _Pokemon;

  /// A factory constructor to create a [Pokemon] instance from a JSON map.
  ///
  /// This method is used when deserializing data from an API response or other JSON sources.
  ///
  /// Example:
  /// ```dart
  /// final json = {'id': 1, 'name': 'Bulbasaur'};
  /// final pokemon = Pokemon.fromJson(json);
  /// ```
  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
}
