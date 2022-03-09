import 'package:flutter/material.dart';
import 'package:flutter_pokedex/application/themes/styles/app_images.dart';

class BackgroundWidget extends StatelessWidget {
  final Widget child;
  const BackgroundWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          Image.asset(
            AppImages.pokeball,
            width: size.width * 0.35,
            height: size.height * .25,
          ),
          child,
        ],
      ),
    );
  }
}
