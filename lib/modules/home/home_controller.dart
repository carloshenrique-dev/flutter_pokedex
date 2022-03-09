import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_pokedex/core/models/pokemon_model.dart';
import 'package:flutter_pokedex/core/view_models/pokemons/pokemons_view_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  final pokemonsList = <PokemonModel>[].obs;
  final _pokemonsList = <PokemonModel>[].obs;
  final PokemonsViewModel _pokemonsViewModel;
  final clearButton = false.obs;

  HomeController({
    required PokemonsViewModel pokemonsViewModel,
  }) : _pokemonsViewModel = pokemonsViewModel;

  @override
  void onInit() async {
    super.onInit();
    await getPokemons();
  }

  getPokemons() async {
    try {
      var response = await _pokemonsViewModel.getPokemons();
      if (response != []) {
        pokemonsList.assignAll(response);
        _pokemonsList.assignAll(response);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void filterPokemon(String description) {
    if (description.isNotEmpty) {
      clearButton(true);
      var newPokemonList = _pokemonsList.where((value) {
        return value.name.toLowerCase().contains(description.toLowerCase());
      });
      pokemonsList.assignAll(newPokemonList);
    } else {
      clearButton(false);
      pokemonsList.assignAll(_pokemonsList);
    }
  }

  void clearSearch() {
    searchController.clear();
    pokemonsList.assignAll(_pokemonsList);
    clearButton(false);
  }
}
