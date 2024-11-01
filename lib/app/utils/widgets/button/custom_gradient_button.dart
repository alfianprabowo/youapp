import 'package:flutter/material.dart';

import '../../constants/color_const.dart';

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
    final List<Color> gradientColors = [
      gradientGold1Color,
      gradientGold2Color,
      gradientGold3Color,
      gradientGold4Color,
      gradientGold5Color,
      gradientGold3Color,
      gradientGold5Color,
    ];
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: gradientColors,
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
