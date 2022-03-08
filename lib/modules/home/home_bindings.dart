import 'package:flutter_pokedex/core/repositories/pokemons/pokemons_repository.dart';
import 'package:flutter_pokedex/core/repositories/pokemons/pokemons_repository_impl.dart';
import 'package:flutter_pokedex/core/view_models/pokemons/pokemons_view_model.dart';
import 'package:flutter_pokedex/core/view_models/pokemons/pokemons_view_model_impl.dart';
import 'package:get/get.dart';
import './home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PokemonsRepository>(
        () => PokemonsRepositoryImpl(
              apiService: Get.find(),
            ),
        fenix: true);
    Get.lazyPut<PokemonsViewModel>(
        () => PokemonsViewModelImpl(
              pokemonsRepository: Get.find(),
            ),
        fenix: true);
    Get.put(
      HomeController(
        pokemonsViewModel: Get.find(),
      ),
    );
  }
}
