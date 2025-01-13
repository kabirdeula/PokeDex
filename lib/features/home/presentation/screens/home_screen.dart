import 'package:flutter/material.dart';
import 'package:pokedex/core/dependency_injection/dependency_injection.dart';
import 'package:pokedex/features/pokemon/pokemon.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<List<Pokemon>> _initializePokemonData() async {
    final pokemonLocalService = serviceLocator<PokemonLocalService>();
    final pokemonService = serviceLocator<PokemonService>();

    final existingData = await pokemonLocalService.fetchAllPokemon();

    if (existingData.isEmpty) {
      await pokemonService.fetchAndStoreAllPokemon();
    }

    return await pokemonLocalService.fetchAllPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: FutureBuilder<List<Pokemon>>(
        future: _initializePokemonData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Pokemon found.'));
          } else {
            final pokemonList = snapshot.data!;
            return ListView.builder(
              itemCount: pokemonList.length,
              itemBuilder: (context, index) {
                final pokemon = pokemonList[index];
                return Text(pokemon.name);
              },
            );
          }
        },
      ),
    );
  }
}
