import 'package:flutter/material.dart';
import 'package:flutter_pokedex/application/themes/styles/app_text_styles.dart';
import 'package:get/get.dart';

class PokemonDetailsCardWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color color;
  const PokemonDetailsCardWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.11,
      width: Get.width * 0.26,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: Center(
        child: Text.rich(
          TextSpan(
            text: '$title\n',
            style: AppTextStyles.textBoldPokemonDetails,
            children: [
              TextSpan(
                text: subTitle,
                style: AppTextStyles.textBoldSubPokemonDetails,
              ),
            ],
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
