import 'package:flutter/material.dart';
import 'package:youapp/app/utils/constants/layout_const.dart';
import 'package:youapp/app/utils/widgets/card/profile_picture_card.dart';

import '../../../utils/widgets/custom_appbar.dart';

class ProfileView extends StatefulWidget {
  // const ProfileView({super.key});

  // DATA USER !!!

  const ProfileView({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(username: "@johndoe"),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(LayoutConst.spaceL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfilePictureCard(
                username: "@johndoe123",
                age: 20,
                gender: "male",
                horoscope: "Virgo",
                horoscopeIcon: Icons.font_download,
                zodiac: "Pig",
                zodiacIcon: Icons.book,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
