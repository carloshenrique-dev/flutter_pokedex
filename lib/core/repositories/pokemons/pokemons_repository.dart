import 'package:flutter_pokedex/core/models/pokemon_model.dart';

abstract class PokemonsRepository {
  Future<List<PokemonModel>> getPokemons();
}
