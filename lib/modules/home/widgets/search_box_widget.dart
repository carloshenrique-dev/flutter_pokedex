import 'package:flutter/material.dart';
import '../../../application/themes/styles/app_colors.dart';
import '../../../application/themes/styles/app_text_styles.dart';

class SearchBoxWidget extends StatelessWidget {
  final Function onChanged;
  final TextEditingController controller;
  final VoidCallback onPressed;
  final bool clearButton;

  const SearchBoxWidget({
    Key? key,
    required this.onChanged,
    required this.controller,
    required this.onPressed,
    required this.clearButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (value) => onChanged(value),
      style: AppTextStyles.searchBarHintText,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.whiteDefault,
        prefixIcon: const Icon(
          Icons.search,
          size: 25,
          color: AppColors.grayColor,
        ),
        suffixIcon: Visibility(
          visible: clearButton,
          child: IconButton(
            onPressed: onPressed,
            icon: const Icon(
              Icons.close,
              color: AppColors.body,
            ),
          ),
        ),
        hintText: 'Search Pokémon',
        hintStyle: AppTextStyles.searchBarHintText,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.white),
          borderRadius: BorderRadius.circular(30),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.white),
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      controller: controller,
    );
  }
}
