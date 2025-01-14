import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/pokemon/pokemon.dart';

class PokemonListView extends StatelessWidget {
  const PokemonListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonCubit, PokemonState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.error != null) {
          return Center(child: Text(state.error!));
        } else if (state.pokemon != null) {
          final pokemon = state.pokemon!;
          return ListView.builder(
            itemCount: pokemon.length,
            itemBuilder: (context, index) {
              return PokemonListTile(
                id: pokemon[index].id,
                name: pokemon[index].name,
              );
            },
          );
        } else {
          return const Center(child: Text('No data'));
        }
      },
    );
  }
}
