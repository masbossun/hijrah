import 'dart:math';

import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/material.dart';

class SortButton extends StatelessWidget {
  const SortButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      child: Icon(
        FeatherIcons.barChart,
      ),
      angle: -90 * pi / 180,
    );
  }
}
