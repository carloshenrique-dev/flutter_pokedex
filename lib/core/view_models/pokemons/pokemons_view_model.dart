import 'package:flutter_pokedex/core/models/pokemon_model.dart';

abstract class PokemonsViewModel {
  Future<List<PokemonModel>> getPokemons();
}
