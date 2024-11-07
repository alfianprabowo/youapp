import 'package:flutter/material.dart';

import '../text/custom_text.dart';

class CreateInterestChip extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const CreateInterestChip({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CreateInterestChip> createState() => _CreateInterestChipState();
}

class _CreateInterestChipState extends State<CreateInterestChip> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color.fromRGBO(255, 255, 255, 0.1),
      ),
      padding: const EdgeInsets.fromLTRB(16, 0, 4, 0),
      child: Row(
        children: [
          CustomText(
            text: widget.text,
            size: 12,
            weight: FontWeight.w600,
          ),
          const SizedBox(width: 7),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: widget.onPressed,
          ),
        ],
      ),
    );
  }
}
