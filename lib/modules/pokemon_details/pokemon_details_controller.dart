import 'package:flutter_pokedex/core/models/pokemon_model.dart';
import 'package:get/get.dart';

class PokemonDetailsController extends GetxController {
  final pokemonsList = <PokemonModel>[].obs;
  late PokemonModel? pokemonModel;

  @override
  void onInit() {
    super.onInit();
    pokemonModel = Get.arguments[0] as PokemonModel;
    pokemonsList.assignAll(Get.arguments[1] as List<PokemonModel>);
  }

  String getEvolutionImage(pokemonModel) {
    String image = '';
    for (var i = 0; i < pokemonsList.length; i++) {
      if (pokemonModel == pokemonsList[i].num) {
        return image = pokemonsList[i].image;
      }
    }
    return image;
  }
}
