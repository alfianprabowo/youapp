import 'package:flutter/material.dart';
import 'package:youapp/app/utils/widgets/text/custom_text.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  // const CustomAppbar({super.key});
  final String username;
  final PreferredSizeWidget? bottomTabBar;

  const CustomAppbar({
    Key? key,
    required this.username,
    this.bottomTabBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CustomText(
        text: username,
        size: 14,
        weight: FontWeight.w600,
      ),
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      actions: [
        IconButton(
          icon: const Icon(
            Icons.more_horiz,
            color: Colors.white,
          ),
          onPressed: () {},
        )
      ],
      bottom: bottomTabBar,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(40);
}
