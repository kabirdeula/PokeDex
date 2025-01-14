import 'package:flutter/material.dart';
import 'package:pokedex/core/utils/utils.dart';

class PokemonListTile extends StatelessWidget {
  final int id;
  final String name;
  const PokemonListTile({super.key, required this.id, required this.name});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text("# $id"),
      title: Text(name.capitalizeEachWord()),
    );
  }
}
