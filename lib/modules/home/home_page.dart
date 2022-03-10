import 'package:flutter_pokedex/application/themes/widgets/background_widget.dart';
import 'package:flutter_pokedex/modules/home/widgets/pokemon_card_widget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../application/themes/styles/app_colors.dart';
import 'widgets/search_box_widget.dart';
import './home_controller.dart';
import 'widgets/title_text_widget.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: BackgroundWidget(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: SizedBox(
                width: Get.width,
                height: Get.height,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerLeft,
                        onPressed: () => Get.back(),
                        icon: const Icon(
                          Icons.sort,
                          size: 30,
                          color: AppColors.whiteDefault,
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: TitleTextWidget(
                        text: 'What Pokémon are you looking for?',
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Obx(
                      () {
                        return SearchBoxWidget(
                          onChanged: (value) => controller.filterPokemon(value),
                          controller: controller.searchController,
                          onPressed: () => controller.clearSearch(),
                          clearButton: controller.clearButton.value,
                        );
                      },
                    ),
                    SizedBox(
                      height: Get.height * 0.02,
                    ),
                    Obx(
                      () {
                        if (controller.pokemonsList.isEmpty) {
                          return SizedBox(
                            height: Get.height * 0.54,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else {
                          return Expanded(
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: Get.height * .01,
                                crossAxisSpacing: Get.width * .03,
                                childAspectRatio: 1.2,
                              ),
                              itemCount: controller.pokemonsList.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemBuilder: (context, index) {
                                var pokemon = controller.pokemonsList[index];
                                return InkWell(
                                  onTap: () => Get.toNamed(
                                    '/pokemondetails',
                                    arguments: [
                                      pokemon,
                                      controller.pokemonsList
                                    ],
                                  ),
                                  child: PokemonCardWidget(
                                    pokemon: pokemon,
                                  ),
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
