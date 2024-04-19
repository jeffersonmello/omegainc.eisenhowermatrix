import 'dart:ui';

import 'package:flutter/material.dart';

class ColorUtil {
  static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static String colorToHex(Color color) {
    return '#${color.value.toRadixString(16).substring(2)}';
  }

  static Color invertColor(Color color) {
    return color.computeLuminance() > 0.5 ? Color(0xFF000000) : Color(0xFFFFFFFF);
  }

  static Color darkenColor(Color color, double factor) {
    return Color.fromARGB(
      color.alpha,
      (color.red * factor).round(),
      (color.green * factor).round(),
      (color.blue * factor).round(),
    );
  }

  static Color lightenColor(Color color, double factor) {
    return Color.fromARGB(
      color.alpha,
      color.red + ((255 - color.red) * factor).round(),
      color.green + ((255 - color.green) * factor).round(),
      color.blue + ((255 - color.blue) * factor).round(),
    );
  }

  static Color blendColors(Color color1, Color color2, double ratio) {
    return Color.fromARGB(
      (color1.alpha + (color2.alpha - color1.alpha) * ratio).round(),
      (color1.red + (color2.red - color1.red) * ratio).round(),
      (color1.green + (color2.green - color1.green) * ratio).round(),
      (color1.blue + (color2.blue - color1.blue) * ratio).round(),
    );
  }

  static MaterialColor genMaterialColor(Color color) {
    // Define uma lista de tons que serão usados para gerar a escala de cores
    List strengths = <double>[.05, .1, .15, .2, .3, .4, .5, .6, .7, .8, .9];

    // Converte a cor fornecida para RGBA
    Map<int, Color> swatch = {
      50: color.withOpacity(strengths[0]),
      100: color.withOpacity(strengths[1]),
      200: color.withOpacity(strengths[2]),
      300: color.withOpacity(strengths[3]),
      400: color.withOpacity(strengths[4]),
      500: color.withOpacity(strengths[5]),
      600: color.withOpacity(strengths[6]),
      700: color.withOpacity(strengths[7]),
      800: color.withOpacity(strengths[8]),
      900: color.withOpacity(strengths[9]),
    };

    // Retorna um MaterialColor baseado na cor fornecida
    return MaterialColor(color.value, swatch);
  }

  static Color gerarColorVariation(Color color, double variation) {
    return Color.fromARGB(
      color.alpha,
      (color.red * variation).round(),
      (color.green * variation).round(),
      (color.blue * variation).round(),
    );
  }

  static Color gerarColorVariationWithAlpha(Color color, double variation, double alpha) {
    return Color.fromARGB(
      (color.alpha * alpha).round(),
      (color.red * variation).round(),
      (color.green * variation).round(),
      (color.blue * variation).round(),
    );
  }

  static Color gerarColorVariationWithAlphaAndOpacity(Color color, double variation, double alpha, double opacity) {
    return Color.fromARGB(
      (color.alpha * alpha).round(),
      (color.red * variation).round(),
      (color.green * variation).round(),
      (color.blue * variation).round(),
    ).withOpacity(opacity);
  }
}