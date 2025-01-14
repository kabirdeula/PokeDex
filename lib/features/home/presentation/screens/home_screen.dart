import 'package:flutter/material.dart';
import 'package:pokedex/features/pokemon/pokemon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: PokemonListView(),
    );
  }
}
