import 'package:flutter/material.dart';

extension SizedBoxExtension on int {
  Widget get width {
    return SizedBox(
      width: toDouble(),
    );
  }

  Widget get height {
    return SizedBox(
      height: toDouble(),
    );
  }

  Widget get wh {
    return SizedBox(
      width: toDouble(),
      height: toDouble(),
    );
  }
}
