import 'package:flutter/material.dart';

import '../../constants/color_const.dart';
import '../../helper/gradient_color.dart';

class CustomGradientButton extends StatelessWidget {
  // const CustomGradientButton({super.key});
  final IconData icon;
  final double size;
  final VoidCallback onPressed;

  const CustomGradientButton({
    Key? key,
    required this.icon,
    required this.size,
    required this.onPressed,
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
      child: IconButton(
        icon: Icon(
          icon,
          size: size,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
