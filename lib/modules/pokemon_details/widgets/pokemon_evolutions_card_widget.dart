import 'package:flutter/material.dart';
import 'package:flutter_pokedex/application/themes/styles/app_colors.dart';
import 'package:flutter_pokedex/application/themes/styles/app_text_styles.dart';
import 'package:get/get.dart';

class PokemonEvolutionsCardWidget extends StatelessWidget {
  final String urlImage;
  final String name;
  const PokemonEvolutionsCardWidget({
    Key? key,
    required this.urlImage,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.dark,
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            children: [
              Image.network(
                urlImage,
                width: Get.width * 0.30,
                height: Get.height * 0.15,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(3),
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                        color: AppColors.white,
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: Get.height * .01,
              ),
              Text(
                name,
                style: AppTextStyles.textBoldPokemonDetails,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
