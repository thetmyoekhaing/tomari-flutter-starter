import 'package:flutter/material.dart';


extension RouteExtension on BuildContext {
  Future<Object?> toNamed({
    required String fullPath,
    bool redirect = true,
    Object? arguments,
  }) async {
    debugPrint("--------------------- call ------------------");
    if (!redirect) {
      return Navigator.of(this).pushNamedAndRemoveUntil(
        fullPath,
        (route) => false,
        arguments: arguments,
      );
    } else {
      return Navigator.of(this).pushNamed(fullPath, arguments: arguments);
    }
  }

  void pop({Object? result}) {
    return Navigator.of(this).pop(result);
  }
}

extension ThemeExtension on BuildContext {
  ColorScheme get colorScheme {
    return Theme.of(this).colorScheme;
  }

  ThemeData get theme {
    return Theme.of(this);
  }

  TextTheme get textTheme {
    return Theme.of(this).textTheme;
  }

  TextStyle? get titleSmall {
    return textTheme.titleSmall;
  }

  TextStyle? get titleMedium {
    return textTheme.titleMedium;
  }

  TextStyle? get titleLarge {
    return textTheme.titleLarge;
  }

  Color get black {
    return Colors.black;
  }
}

extension SizeExtension on BuildContext {
  // device width and height
  double get dw => MediaQuery.of(this).size.width;
  double get dh => MediaQuery.of(this).size.height;
}


// if localization is used
// extension L10NExtension on BuildContext {
//  AppLocalizations get l10n {
//    return AppLocalizations.of(this)!;
//  }

//  String get _locale {
//    return Localizations.localeOf(this).languageCode;
//  }

//  bool get isEn {
//    return _locale == 'en';
//  }
// }
