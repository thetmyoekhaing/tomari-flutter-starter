import 'package:flutter/material.dart';

extension PaddingExtension on Widget {
  /// Padding horizontal with widget
  Widget paddingHorizontal(double padding) => Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: this,
      );

  /// Padding vertical with widget
  Widget paddingVertical(double padding) => Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: this,
      );

  Widget pAll(double padding) {
    return Padding(
      padding: EdgeInsets.all(padding),
      child: this,
    );
  }

  Widget pOnly({double? left, double? right, double? top, double? bottom}) {
    return Padding(
      padding: EdgeInsets.only(
        left: left ?? 0,
        right: right ?? 0,
        top: top ?? 0,
        bottom: bottom ?? 0,
      ),
      child: this,
    );
  }
}
