import 'package:flutter/material.dart';
import 'package:flutter_pokedex/application/themes/styles/app_colors.dart';
import 'package:get/get.dart';

class PokemonPhotoWidget extends StatelessWidget {
  final String urlImage;
  const PokemonPhotoWidget({
    Key? key,
    required this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CircleAvatar(
        maxRadius: 70,
        minRadius: 60,
        backgroundColor: AppColors.grayColor,
        child: Image.network(
          urlImage,
          width: Get.width * 0.85,
          height: Get.height * 0.25,
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
      ),
    );
  }
}
