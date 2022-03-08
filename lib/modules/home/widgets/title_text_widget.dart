import 'package:flutter/material.dart';
import '../../../application/themes/styles/app_text_styles.dart';

class TitleTextWidget extends StatelessWidget {
  final String text;
  const TitleTextWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.homeTitleWhite,
      textAlign: TextAlign.start,
    );
  }
}
