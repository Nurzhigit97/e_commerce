import 'package:flutter/material.dart';

class AppColors {
  static const Color grey = Color(0xFF999999);
  static const Color grey1 = Color(0xFFE8E8E8);
  static const Color grey2 = Color(0xffE0E0E0);
  static const Color grey3 = Color(0xffDBDBDB);
  static const Color grey4 = Color(0xffCECECE);
  static const Color grey5 = Color(0xffBfbfbf);
  static const Color hintBackColor = Color(0xffF5F7FA);
  static const Color greyf8 = Color(0xffF8F8F8);
  static const Color greyED = Color(0xffEDEDED);
  static const Color financeGreenDashBorder = Color(0xff0F8F67);
  static const Color greyEA = Color(0xffEAEAEA);
  static const Color grey0 = Color(0xFF9F9F9F);
  static const Color greyF8 = Color(0xffF9F8F8);
  static const Color cardBlue3Color = Color(0xff4F89FE);
  static const Color cardBlue2Color = Color(0xff3A7CFF);
  static const Color cardBlue1Color = Color(0xff266EFF);
  static const Color pinkChart = Color(0xffCC0093);
  static const Color cardBlueColor = Color(0xff488BEE);

  static const Color borderColor = Color(0xffC0C4C8);

  static const Color greyE4 = Color(0xffE4E4E4);
  static const Color scaffoldColor = Color(0xffF5F7FA);
  static const Color transparent = Colors.transparent;
  static const Color grey63 = Color(0xff636363);
  static const Color homeGreenColor = Color(0xff00FF0A);
  static const Color greenBorder = Color(0xff00CC08);
  static Color green1 = const Color(0xFF00CC08);

  static Color red1 = const Color(0xFFE60000);
  static const Color errorRed = Color(0xffF5001D);
  static const Color pink = Color(0xffCC0093);

  static const Color black = Colors.black;
  static const Color black1 = Color.fromARGB(180, 0, 0, 0);
  static const Color black2 = Color(0xFF9F9F9F);
  static const Color blue = Color(0xFF1672EC);
  static const Color blue2 = Color(0xFF1862AF);
  static const Color blue3 = Color.fromRGBO(24, 98, 175, 0.3);
  static const Color blue4 = Color(0xFF0062F5);

  static const Color white = Colors.white;
  static const Color greenAccent = Color(0xffCADB36);
  static const Color green2 = Color(0xffE9EFB4);
  static const Color grey6 = Color(0xff636363);

  static Color orangeRed = const Color(0xFFFF6726);
  static Color green = const Color(0xFF008C44);
  static Color green3 = const Color(0xFF00CC08);
  static Color limeGreen = const Color(0xFF63B358);
  static Color yellow = const Color(0xFFFFCE00);
  static Color blue5 = const Color(0xFF007AFF);
  static Color blue6 = const Color(0xFF0075FF);
  static Color grey67 = const Color(0xFF676767);
  static Color blue7 = const Color(0xFFE7F0FF);

  static Color yellow2 = const Color(0xFFF1B00A);
  static Color red = const Color(0xFFF74B39);
  static Color grey7 = const Color(0xFFD0D0D0);
  static Color grey9 = const Color(0xFFD3DDE9);
  static Color grey8 = const Color(0xFF8C8C8C);
  static const primaryColor = Color(0xFF0062F5);
  static const Color primaryColor2 = Color(0xFF1856CD);
  static const Color grey10 = Color(0xFFECEEEF);

  static List<Color> gradientColorsOrange = [
    const Color(0xFFFE9202),
    const Color(0xFFEB510B),
  ];
  static List<Color> gradientColorsYellow = [
    const Color(0xFFFFE64E),
    const Color(0xFFEDAF00),
  ];

  static List<Color> gradientColorsGreen = [
    const Color(0xFF459654),
    const Color(0xFF64B567),
  ];
  static List<Color> gradientColorsBlue = [
    const Color(0xFF01512C),
    const Color(0xFF69BA6A),
  ];

  static const MaterialColor primary =
      MaterialColor(_primaryPrimaryValue, <int, Color>{
        50: Color(0xFFE0F2FF),
        100: Color(0xFFB3D5FF),
        200: Color(0xFF80B8FF),
        300: Color(0xFF4D9CFF),
        400: Color(0xFF269FFF),
        500: Color(_primaryPrimaryValue),
        600: Color(0xFF0056D2),
        700: Color(0xFF004BBA),
        800: Color(0xFF0041A2),
        900: Color(0xFF003A8B),
      });
  static const int _primaryPrimaryValue = 0xFF0062F5;

  static const MaterialColor primaryAccent =
      MaterialColor(_primaryAccentValue, <int, Color>{
        100: Color(0xFF99D3FF),
        200: Color(_primaryAccentValue),
        400: Color(0xFF33A5FF),
        700: Color(0xFF008CFF),
      });
  static const int _primaryAccentValue = 0xFF66B2FF;

  static List<String> productColors = [
    'FFFFFF',
    'ADB6BE',
    '1C1C1C',
    '1869B1',
    '5AC5DF',
    '0F8F67',
    '00CC08',
    'ECF106',
    'F1B00A',
    'F5001D',
    'CC0093',
    'A250C2',
  ];
}
