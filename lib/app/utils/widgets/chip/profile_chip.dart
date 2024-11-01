import 'package:flutter/material.dart';

import '../../constants/layout_const.dart';
import '../text/custom_text.dart';

class ProfileChip extends StatelessWidget {
  final IconData? icon;
  final String? text;

  // const ProfileChip({super.key});
  const ProfileChip({
    Key? key,
    this.icon,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(100)),
        color: Color.fromRGBO(255, 255, 255, 0.06),
        backgroundBlendMode: BlendMode.dstATop,
      ),
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 8.0),
      child: Row(
        children: [
          Icon(
            icon!,
            size: 20,
          ),
          const SizedBox(width: LayoutConst.spaceM),
          CustomText(
            text: text!,
            size: 14,
            weight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
