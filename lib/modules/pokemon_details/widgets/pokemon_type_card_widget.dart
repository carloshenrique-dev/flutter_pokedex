import 'package:flutter/material.dart';
import 'package:flutter_pokedex/application/themes/styles/app_text_styles.dart';
import 'package:get/get.dart';

class PokemonTypeCardWidget extends StatelessWidget {
  final String type;
  final Color color;

  const PokemonTypeCardWidget({
    Key? key,
    required this.type,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      child: Container(
        height: Get.height * 0.06,
        width: Get.width * 0.35,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            type,
            textAlign: TextAlign.center,
            style: AppTextStyles.textBoldPokemonDetails,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
