import 'dart:ui';
import 'package:flutter_pokedex/application/themes/styles/app_colors.dart';
import 'package:flutter_pokedex/application/themes/styles/app_text_styles.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './pokemon_details_controller.dart';
import 'widgets/pokemon_details_card_widget.dart';
import 'widgets/pokemon_evolutions_card_widget.dart';
import 'widgets/pokemon_name_widget.dart';
import 'widgets/pokemon_photo_widget.dart';
import 'widgets/pokemon_type_card_widget.dart';

class PokemonDetailsPage extends GetView<PokemonDetailsController> {
  const PokemonDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        centerTitle: true,
        title: Text(
          controller.pokemonModel!.name,
          style: const TextStyle(fontSize: 24),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: NetworkImage(
              controller.pokemonModel!.image,
            ),
            fit: BoxFit.none,
            filterQuality: FilterQuality.high,
          ),
        ),
        child: BackdropFilter(
          blendMode: BlendMode.srcOver,
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: Get.height * .012,
              ),
              PokemonPhotoWidget(
                urlImage: controller.pokemonModel!.image,
              ),
              SizedBox(
                height: Get.height * .012,
              ),
              PokemonNameWidget(
                color: controller.pokemonModel!.baseColor!,
                title:
                    '#${controller.pokemonModel!.num} ${controller.pokemonModel!.name}',
              ),
              SizedBox(
                height: Get.height * .015,
              ),
              Expanded(
                child: Card(
                  margin: EdgeInsets.zero,
                  elevation: 7,
                  color: AppColors.background,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Types',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.pokemonDetailsTitle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: generateTypes(),
                      ),
                      Text(
                        'About ${controller.pokemonModel!.name}',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.pokemonDetailsTitle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PokemonDetailsCardWidget(
                            title: 'Number',
                            subTitle: '#${controller.pokemonModel!.num}',
                            color: AppColors.dark,
                          ),
                          PokemonDetailsCardWidget(
                              title: 'Weight',
                              subTitle: controller.pokemonModel!.weight,
                              color: AppColors.dark),
                          PokemonDetailsCardWidget(
                            title: 'Height',
                            subTitle: controller.pokemonModel!.height,
                            color: AppColors.dark,
                          ),
                        ],
                      ),
                      Text(
                        'Evolutions',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.pokemonDetailsTitle,
                      ),
                      Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...generatePreviousEvolution(),
                            ...generateNextEvolution(),
                          ],
                        );
                      }),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> generateTypes() {
    return List.generate(
      controller.pokemonModel!.type.length,
      (index) {
        var type = controller.pokemonModel!.type[index];
        return PokemonTypeCardWidget(
          color: controller.pokemonModel!.getColor(type)!,
          type: type,
        );
      },
    );
  }

  generatePreviousEvolution() {
    if (controller.pokemonModel?.previousEvolution != null) {
      return List.generate(
        controller.pokemonModel!.previousEvolution.length,
        (index) {
          var type = controller.pokemonModel!.previousEvolution[index];
          if (type['name'] != null) {
            return PokemonEvolutionsCardWidget(
              name: type['name'],
              urlImage: controller.getEvolutionImage(type['num']),
            );
          }
        },
      );
    }
    return [];
  }

  generateNextEvolution() {
    if (controller.pokemonModel?.nextEvolution != null) {
      return List.generate(
        controller.pokemonModel!.nextEvolution.length,
        (index) {
          var type = controller.pokemonModel!.nextEvolution[index];
          if (type['name'] != null) {
            return PokemonEvolutionsCardWidget(
              name: type['name'],
              urlImage: controller.getEvolutionImage(type['num']),
            );
          }
        },
      );
    }
    return [];
  }
}
