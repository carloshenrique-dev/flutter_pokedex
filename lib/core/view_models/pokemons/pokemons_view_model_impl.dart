import 'package:flutter_pokedex/core/models/pokemon_model.dart';
import 'package:flutter_pokedex/core/repositories/pokemons/pokemons_repository.dart';
import './pokemons_view_model.dart';

class PokemonsViewModelImpl implements PokemonsViewModel {
  final PokemonsRepository _pokemonsRepository;

  PokemonsViewModelImpl({
    required PokemonsRepository pokemonsRepository,
  }) : _pokemonsRepository = pokemonsRepository;

  @override
  Future<List<PokemonModel>> getPokemons() => _pokemonsRepository.getPokemons();
}
