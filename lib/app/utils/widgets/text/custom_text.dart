import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  // const TitleText({super.key});
  final String text;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final TextAlign? alignment;

  const CustomText({
    Key? key,
    required this.text,
    this.size,
    this.color,
    this.weight,
    this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getTextStyle(
        color: color,
        size: size,
        weight: weight,
      ),
      textAlign: alignment ?? TextAlign.start,
    );
  }

  static TextStyle getTextStyle({double? size, Color? color, FontWeight? weight}) {
    return TextStyle(
      fontSize: size ?? 16,
      color: color ?? Colors.white,
      fontWeight: weight ?? FontWeight.w700,
      fontFamily: 'Inter',
    );
  }
}
