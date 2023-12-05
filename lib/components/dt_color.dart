import 'package:flutter/material.dart';

class DTColor {
  static const Color primary = Color(0xFF0E5DAE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color navBG = Color(0xFFF8F8F8);
  static const Color placeholderBg = Color(0xFFF6F6F6);
  static const Color assetGrey = Color(0xFF808080);
  static const Color dividerGrey = Color(0xFFEBEBEB);
  static const Color whiteBG = Color(0xFFF5F5F5);
  static Color tabIndicatorBg = tabIndicatorTextColor.withOpacity(0.2);

  static const Color positiveGreen = Color(0xFF0EC240);
  static const Color negativeRed = Color(0xFFFF6B6B);
  static const Color neutralBlue = Color(0xFF1685F8);

  static const Color tabIndicatorTextColor = Color(0xFF8C8C8C);
  static const Color nepseMainChartTabIndicatorTextColor = Color(0xFF858585);
  static const Color primaryTextColor = Color(0xFF575757);
  static const Color secondaryTextColor = Color(0xFF1685F8);
  static const Color placeholderTextColor = Color(0xFF9E9E9E);
  static const Color headerTextColor = Color(0xFF4E4E4E);
  static const Color greyTextColor = Color(0xFFAFAFAF);
  static const Color darkestGreyTextColor = Color(0xFF7C7C7C);
  static const Color darkerGreyTextColor = Color(0xFF909090);
  static const Color appBg = Color(0xFFF7F8FB);
  static const Color buttonBgGrey = Color(0xFFEBECED);
  static const Color gaugeChartBG = Color(0xffD9E1E8);
  static const Color overviewTabBG = Color(0xFFF3F5F8);
  static const Color watchListAddBg = Color(0xFFE9EFF5);
  static const Color tableNameText = Color(0xFF5E5B5B);
  static const Color newsDivider = Color(0xFFEAEAEA);
  static const Color newsTitleText = Color(0xFF4E4E4E);
  static const Color tabBg = Color(0xFFFCFCFC);
  static const Color calculatorBorder = Color(0xFFE4EFFB);
  static const Color calculatorBackground = Color(0xFFF2F9FF);
  static const Color marketToolsBg = Color(0xFFE5EFF9);
  static const Color ipoCornerFontColor = Color(0xFF8F8F8F);
  static const Color topCompaniesTabBg = Color(0xFFF3F3F3);
  static const Color dividendHistoryBg = Color(0xFFFFFDF4);
  static const Color dtMarketCalendarBg = Color(0xFFFFFEF4);
  static const Color dtSubscribedBg = Color(0xFFF9F3DF);
  static const Color dtSubscribedText = Color(0xFFB88F00);
  static const Color calculatorShade = Color(0xFFF4FAFF);
  static var positiveGradientColors = [
    positiveGreen.withOpacity(0.3),
    positiveGreen.withOpacity(0.01)
  ];

  static var negativeGradientColors = [
    negativeRed.withOpacity(0.3),
    negativeRed.withOpacity(0.01)
  ];

  static var neutralGradientColors = [
    neutralBlue.withOpacity(0.3),
    neutralBlue.withOpacity(0.01)
  ];

  static var buttonGradientColors = [
    const Color(0xFF1685F8),
    const Color(0xFF52A7FF),
  ];
}

Map<int, Color> primarySwatch = {
  50: DTColor.primary.withOpacity(0.1),
  100: DTColor.primary.withOpacity(0.2),
  200: DTColor.primary.withOpacity(0.3),
  300: DTColor.primary.withOpacity(0.4),
  400: DTColor.primary.withOpacity(0.5),
  500: DTColor.primary.withOpacity(0.6),
  600: DTColor.primary.withOpacity(0.7),
  700: DTColor.primary.withOpacity(0.8),
  800: DTColor.primary.withOpacity(0.9),
  900: DTColor.primary.withOpacity(1),
};
