import 'dart:convert';
import 'dart:developer';
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
      //pokeapi
      /*var response = await _apiService.get(
          path: 'https://pokeapi.co/api/v2/pokemon?limit=151%27');*/
      //pokedexapi
      var response = await _apiService.get(
          path:
              'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json');
      final json = jsonDecode(response.data) as Map<String, dynamic>;
      final list = json['pokemon'] as List<dynamic>;
      return list.map((e) => PokemonModel.fromMap(e)).toList();
    } catch (e) {
      log(e.toString());
      return [];
    }
  }
}
