import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static final textBoldPokemonDetails = GoogleFonts.mulish(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.whiteDefault,
  );
  static final textBoldSubPokemonDetails = GoogleFonts.mulish(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteDefault,
  );
  static final TextStyle pokemonDetailsTitle = GoogleFonts.mulish(
    color: AppColors.whiteDefault,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );
  static final TextStyle homeTitleWhite = GoogleFonts.mulish(
    color: AppColors.whiteDefault,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );
  static final TextStyle pokemonCardTitle = GoogleFonts.mulish(
    color: AppColors.whiteDefault,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.normal,
  );
  static final searchBarHintText = GoogleFonts.mulish(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColors.grayColor,
  );
}
