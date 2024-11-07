import 'package:flutter/material.dart';
import 'package:youapp/app/utils/constants/text_const.dart';
import 'package:youapp/app/utils/widgets/text/custom_text.dart';

import '../../constants/color_const.dart';
import '../../constants/layout_const.dart';

class ProfileCard extends StatefulWidget {
  final String title;
  final Widget action;
  final Widget body;
  // final VoidCallback onPressed;

  // const ProfileCard({super.key});

  const ProfileCard({
    Key? key,
    required this.title,
    required this.action,
    required this.body,
    // required this.onPressed,
  }) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 0,
        maxHeight: double.infinity,
        minWidth: 0,
        maxWidth: 400,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(14),
        ),
        color: profileCardColor,
      ),
      padding: const EdgeInsets.fromLTRB(27.0, 8.0, 16.0, 16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CustomText(
                text: widget.title,
              ),
              widget.action,
              // IconButton(
              //   icon: const Icon(
              //     Icons.edit,
              //     size: 17,
              //   ),
              //   onPressed: widget.onPressed,
              // ),
            ],
          ),
          const SizedBox(height: LayoutConst.spaceL),
          widget.body,
          // CustomText(
          //   text: widget.title == TextConst.about ? TextConst.addAbout : TextConst.addInterest,
          //   size: 14,
          //   weight: FontWeight.w500,
          // ),
        ],
      ),
    );
  }
}
