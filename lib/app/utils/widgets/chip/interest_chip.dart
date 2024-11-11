import 'package:flutter/material.dart';

import '../text/custom_text.dart';

class InterestChip extends StatelessWidget {
  final String text;

  const InterestChip({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        color: Color.fromRGBO(255, 255, 255, 0.06),
      ),
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      child: CustomText(
        text: text,
        size: 14,
        weight: FontWeight.w600,
      ),
    );
  }
}
