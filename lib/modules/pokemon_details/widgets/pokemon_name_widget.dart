import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_pokedex/application/themes/styles/app_text_styles.dart';

class PokemonNameWidget extends StatelessWidget {
  final String title;
  final Color color;
  const PokemonNameWidget({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.08,
      width: Get.width * 0.5,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextStyles.textBoldPokemonDetails,
        ),
      ),
    );
  }
}
