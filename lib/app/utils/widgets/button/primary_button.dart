import 'package:flutter/material.dart';
import 'package:youapp/app/utils/widgets/text/custom_text.dart';

import '../../constants/color_const.dart';

class PrimaryButton extends StatelessWidget {
  // const PrimaryButton({super.key});
  final String text;
  final VoidCallback onPressed;
  final double? width;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Gradient gradient = const LinearGradient(colors: [
      primaryBlueColor,
      secondaryBlueColor,
    ]);

    return Container(
      height: 48.0,
      width: width ?? MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: gradient,
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 20,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: onPressed,
            child: Center(
              child: CustomText(
                text: text,
              ),
            )),
      ),
    );
  }
}
