import 'package:get/get.dart';
import './pokemon_details_controller.dart';

class PokemonDetailsBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(PokemonDetailsController());
    }
}