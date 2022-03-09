import 'package:flutter_pokedex/core/models/pokemon_model.dart';
import 'package:get/get.dart';

class PokemonDetailsController extends GetxController {
  late PokemonModel? pokemonModel;

  @override
  void onInit() {
    super.onInit();
    pokemonModel = Get.arguments;
  }
}
