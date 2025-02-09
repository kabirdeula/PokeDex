import 'package:flutter/material.dart';
import 'package:pokedex/core/utils/utils.dart';
import 'package:pokedex/features/pokemon/pokemon.dart';

class PokemonListTile extends StatelessWidget {
  final int id;
  final String name;
  final List<TypeSlot> types;

  const PokemonListTile(
      {super.key, required this.id, required this.name, required this.types});

  @override
  Widget build(BuildContext context) {
    final primaryColor =
        types.isNotEmpty ? _getTypeColor(types.first.type.name) : Colors.grey;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: primaryColor.withAlpha(140),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildInfoColumn(),
          _buildImage(),
        ],
      ),
    );
  }

  SizedBox _buildImage() {
    return SizedBox(
      height: 50,
      width: 50,
      child: Placeholder(),
    );
  }

  Column _buildInfoColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4.0,
      children: [
        Row(
          children: [
            Row(
              spacing: 8.0,
              children: [
                Text(
                  "#${id.toString().padLeft(3, '0')}",
                  style: TextStyle(fontSize: 22),
                ),
                Text(name.capitalizeEachWord(), style: TextStyle(fontSize: 22)),
              ],
            ),
          ],
        ),
        _buildTypeChips()
      ],
    );
  }

  Wrap _buildTypeChips() {
    return Wrap(
      spacing: 8.0,
      children: types
          .map(
            (type) => Chip(
              label: Text(
                type.type.name.capitalizeEachWord(),
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: _getTypeColor(type.type.name).withAlpha(220),
              visualDensity: VisualDensity.compact,
            ),
          )
          .toList(),
    );
  }

  Color _getTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'grass':
        return Colors.green;
      case 'bug':
        return Colors.lightGreen;
      case 'poison':
        return Colors.purple;
      case 'fire':
        return Colors.red;
      case 'water':
        return Colors.blue;
      case 'flying':
        return Colors.lightBlue;
      case 'electric':
        return Colors.yellow;
      case 'psychic':
        return Colors.pink;
      case 'ice':
        return Colors.lightBlueAccent;
      case 'dragon':
        return Colors.indigo;
      case 'dark':
        return Colors.black87;
      case 'fairy':
        return Colors.pinkAccent;
      default:
        return Colors.grey;
    }
  }
}
