import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../application/modules/modules.dart';
import 'pokemon_details_bindings.dart';
import 'pokemon_details_page.dart';

class PokemonDetailsModule extends Modules {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/pokemondetails',
      page: () => const PokemonDetailsPage(),
      binding: PokemonDetailsBindings(),
    )
  ];
}
