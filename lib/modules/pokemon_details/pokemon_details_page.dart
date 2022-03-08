import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './pokemon_details_controller.dart';

class PokemonDetailsPage extends GetView<PokemonDetailsController> {
    
    const PokemonDetailsPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('PokemonDetailsPage'),),
            body: Container(),
        );
    }
}