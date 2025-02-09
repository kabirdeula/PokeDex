import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'pokemon.freezed.dart';
part 'pokemon.g.dart';

/// Represents a Pokémon model with its attributes.
///
/// This model includes details such as the Pokémon's ID, name, and types.
///
/// - [id]: The unique identifier of the Pokémon (e.g., its Pokédex number).
/// - [name]: The name of the Pokémon.
/// - [types]: A list of type slots that describe the Pokémon's elemental types.
@HiveType(typeId: 0)
@freezed
class Pokemon with _$Pokemon {
  /// Creates a new instance of the Pokémon model.
  ///
  /// Example:
  /// ```dart
  /// final pokemon = Pokemon(
  ///   id: 1,
  ///   name: 'Bulbasaur',
  ///   types: [
  ///     TypeSlot(slot: 1, type: PokemonType(name: 'Grass', url: '...')),
  ///     TypeSlot(slot: 2, type: PokemonType(name: 'Poison', url: '...')),
  ///   ],
  /// );
  /// ```
  @HiveType(typeId: 0)
  const factory Pokemon({
    @HiveField(0) required int id,
    @HiveField(1) required String name,
    @HiveField(2) required List<TypeSlot> types,
  }) = _Pokemon;

  /// Factory constructor to create a [Pokemon] instance from a JSON map.
  ///
  /// Used for deserializing data from an API response or JSON source.
  ///
  /// Example:
  /// ```dart
  /// final json = {'id': 1, 'name': 'Bulbasaur', 'types': [...]};
  /// final pokemon = Pokemon.fromJson(json);
  /// ```
  factory Pokemon.fromJson(Map<String, dynamic> json) =>
      _$PokemonFromJson(json);
}

/// Represents a type slot associated with a Pokémon's elemental type.
///
/// - [slot]: The slot number indicating the order of the type.
/// - [type]: The actual type details (e.g., name and URL).
@HiveType(typeId: 1)
@freezed
class TypeSlot with _$TypeSlot {
  /// Creates a new instance of a type slot.
  ///
  /// Example:
  /// ```dart
  /// final typeSlot = TypeSlot(
  ///   slot: 1,
  ///   type: PokemonType(name: 'Grass', url: '...'),
  /// );
  /// ```
  @HiveType(typeId: 1)
  const factory TypeSlot({
    @HiveField(0) required int slot,
    @HiveField(1) required PokemonType type,
  }) = _TypeSlot;

  /// Factory constructor to create a [TypeSlot] instance from a JSON map.
  ///
  /// Example:
  /// ```dart
  /// final json = {'slot': 1, 'type': {'name': 'Grass', 'url': '...'}};
  /// final typeSlot = TypeSlot.fromJson(json);
  /// ```
  factory TypeSlot.fromJson(Map<String, dynamic> json) =>
      _$TypeSlotFromJson(json);
}

/// Represents a Pokémon's elemental type details.
///
/// - [name]: The name of the type (e.g., 'Fire', 'Water').
/// - [url]: A reference URL providing additional information about the type.
@HiveType(typeId: 2)
@freezed
class PokemonType with _$PokemonType {
  /// Creates a new instance of a Pokémon type.
  ///
  /// Example:
  /// ```dart
  /// final pokemonType = PokemonType(name: 'Fire', url: '...');
  /// ```
  @HiveType(typeId: 2)
  const factory PokemonType({
    @HiveField(0) required String name,
    @HiveField(1) required String url,
  }) = _PokemonType;

  /// Factory constructor to create a [PokemonType] instance from a JSON map.
  ///
  /// Example:
  /// ```dart
  /// final json = {'name': 'Fire', 'url': '...'};
  /// final pokemonType = PokemonType.fromJson(json);
  /// ```
  factory PokemonType.fromJson(Map<String, dynamic> json) =>
      _$PokemonTypeFromJson(json);
}
