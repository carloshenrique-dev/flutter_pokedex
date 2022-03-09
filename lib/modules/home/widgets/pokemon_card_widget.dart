import 'package:flutter/material.dart';
import 'package:flutter_pokedex/application/themes/styles/app_colors.dart';
import 'package:flutter_pokedex/application/themes/styles/app_text_styles.dart';
import 'package:flutter_pokedex/core/models/pokemon_model.dart';
import 'package:get/get.dart';

class PokemonCardWidget extends StatelessWidget {
  final PokemonModel pokemon;

  const PokemonCardWidget({
    Key? key,
    required this.pokemon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        color: pokemon.baseColor!.withOpacity(0.8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            pokemon.image,
            height: 100,
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
          Text(
            pokemon.name.capitalizeFirst!,
            style: AppTextStyles.productDetailsWhite,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
