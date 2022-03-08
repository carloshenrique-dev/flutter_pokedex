import 'package:flutter_pokedex/modules/home/home_module.dart';
import 'package:flutter_pokedex/modules/pokemon_details/pokemon_details_module.dart';

abstract class AppRoutes {
  static final routes = [
    ...HomeModule().routers,
    ...PokemonDetailsModule().routers,
  ];
}
