import 'dart:developer';
import 'package:flutter_pokedex/core/models/pokemon_list_model.dart';
import 'package:flutter_pokedex/core/models/pokemon_model.dart';
import 'package:flutter_pokedex/core/services/api_service.dart';
import './pokemons_repository.dart';

class PokemonsRepositoryImpl implements PokemonsRepository {
  final ApiService _apiService;

  PokemonsRepositoryImpl({
    required ApiService apiService,
  }) : _apiService = apiService;

  @override
  Future<List<PokemonModel>> getPokemons() async {
    try {
      List<PokemonModel> pokemons = [];
      var response = await _apiService.get(
          path: 'https://pokeapi.co/api/v2/pokemon?limit=151%27');
      if (response.data != null && response.data != []) {
        var list = List<PokemonListModel>.from(response.data['results']
            .map((model) => PokemonListModel.fromMap(model))
            .toList());
        for (var i = 0; i < list.length; i++) {
          var ret = await _apiService.get(path: list[i].url!);
          pokemons.add(PokemonModel(
            name: ret.data['name'],
            spriteUrl: ret.data['sprites']['front_default'],
          ));
        }
      }
      return pokemons;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
