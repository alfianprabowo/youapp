import 'package:flutter/material.dart';

import '../../helper/gradient_color.dart';

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final double size;
  const CustomIcon({
    Key? key,
    required this.icon,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: listGradientGoldColors,
      ).createShader(bounds),
      child: Icon(
        icon,
        size: size,
      ),
    );
  }
}
