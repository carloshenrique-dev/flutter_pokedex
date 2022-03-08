import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter_pokedex/core/models/pokemon_model.dart';
import 'package:flutter_pokedex/core/view_models/pokemons/pokemons_view_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  TextEditingController searchController = TextEditingController();
  final pokemonsList = <PokemonModel>[].obs;
  final PokemonsViewModel _pokemonsViewModel;

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
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
