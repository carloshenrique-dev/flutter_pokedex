import 'package:flutter/material.dart';
import 'package:flutter_pokedex/application/themes/styles/app_colors.dart';

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
          width: 100,
          height: 100,
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
