import 'package:flutter/cupertino.dart';

///
/// Миксин для работы с темой
///
mixin Themeable {
  ///
  /// Возвращает истину если сейчас включена темная тема
  ///
  bool isDarkMode(BuildContext context) {
    final Brightness brightness =
        MediaQuery.maybeOf(context)?.platformBrightness ??
            CupertinoTheme.brightnessOf(context);

    return brightness == Brightness.dark;
  }

  Color colorByMode(
    BuildContext context, {
    Color dark = CupertinoColors.black,
    Color light = CupertinoColors.white,
  }) {
    return isDarkMode(context) ? dark : light;
  }

  Color colorByModeReverse(
    BuildContext context, {
    Color dark = CupertinoColors.white,
    Color light = CupertinoColors.black,
  }) {
    return isDarkMode(context) ? dark : light;
  }

  Color colorByModeGrey(
    BuildContext context, {
    Color dark = CupertinoColors.white,
    Color light = CupertinoColors.systemGroupedBackground,
  }) {
    return isDarkMode(context) ? dark : light;
  }

  Color colorByModeGrey2(
    BuildContext context, {
    Color dark = CupertinoColors.systemGrey,
    Color light = CupertinoColors.white,
  }) {
    return isDarkMode(context) ? dark : light;
  }

  Color colorByModeIndigoWhite(
    BuildContext context, {
    Color dark = CupertinoColors.white,
    Color light = CupertinoColors.systemIndigo,
  }) {
    return isDarkMode(context) ? dark : light;
  }
}
