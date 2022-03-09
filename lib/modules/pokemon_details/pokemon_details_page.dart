import 'dart:ui';

import 'package:flutter_pokedex/application/themes/styles/app_colors.dart';
import 'package:flutter_pokedex/application/themes/styles/app_text_styles.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './pokemon_details_controller.dart';
import 'widgets/pokemon_details_card_widget.dart';
import 'widgets/pokemon_photo_widget.dart';

class PokemonDetailsPage extends GetView<PokemonDetailsController> {
  const PokemonDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * .035,
                ),
                PokemonPhotoWidget(
                  urlImage: controller.pokemonModel!.image,
                ),
                SizedBox(
                  height: Get.height * .035,
                ),
                Container(
                  height: Get.height * 0.06,
                  width: Get.width * 0.5,
                  decoration: BoxDecoration(
                    color: controller.pokemonModel!.baseColor!,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      '#${controller.pokemonModel!.num} ${controller.pokemonModel!.name}',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.textBoldPokemonDetails,
                    ),
                  ),
                ),
                SizedBox(
                  height: Get.height * .035,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Types',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.homeTitleWhite,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            width: Get.width * .745,
                            height: Get.height * .06,
                            child: Text(
                              'a',
                              style: AppTextStyles.homeTitleWhite,
                            )
                            /*ListView.separated(
                              separatorBuilder: (context, _) {
                                return const VerticalDivider();
                              },
                              itemCount: controller.pokemonModel!.type.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                var type = controller.pokemonModel!.type[index];
                                return Container(
                                  height: Get.height * 0.06,
                                  width: Get.width * 0.35,
                                  decoration: BoxDecoration(
                                    color: controller.pokemonModel!.baseColor!,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      type,
                                      textAlign: TextAlign.center,
                                      style:
                                          AppTextStyles.textBoldPokemonDetails,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                );
                              },
                            )*/
                            ,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            PokemonDetailsCardWidget(
                              title: 'Id',
                              subTitle: '${controller.pokemonModel!.id}',
                              color: controller.pokemonModel!.baseColor!,
                            ),
                            PokemonDetailsCardWidget(
                                title: 'Peso',
                                subTitle: controller.pokemonModel!.weight,
                                color: controller.pokemonModel!.baseColor!),
                            PokemonDetailsCardWidget(
                              title: 'Altura',
                              subTitle: controller.pokemonModel!.height,
                              color: controller.pokemonModel!.baseColor!,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: Get.width * .05),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Recomendações',
                              textAlign: TextAlign.start,
                            ),
                          ),
                        ),
                        /*RecomendationsCardWidget(
                          icon: FontAwesomeIcons.cookieBite,
                          title: 'Alimentacao',
                          color: AppColors.lightPink,
                          subtitle: controller
                              .petModel.favoriteFood!.capitalizeFirst!,
                        ),
                        const RecomendationsCardWidget(
                          icon: Icons.pets,
                          title: 'Passeio',
                          color: AppColors.backgroundSplash,
                          subtitle: 'Sempre lembrar do meu',
                        ),*/
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
