import 'package:flutter/material.dart';
import 'package:youapp/app/utils/constants/color_const.dart';
import 'package:youapp/app/utils/constants/layout_const.dart';
import 'package:youapp/app/utils/widgets/chip/profile_chip.dart';
import 'package:youapp/app/utils/widgets/text/custom_text.dart';

class ProfilePictureCard extends StatefulWidget {
  // const ProfilePictureCard({super.key});
  final String username;
  final int? age;
  final String? image;
  final String? gender;
  final String? horoscope;
  final IconData? horoscopeIcon;
  final String? zodiac;
  final IconData? zodiacIcon;

  const ProfilePictureCard({
    Key? key,
    required this.username,
    this.age,
    this.image,
    this.gender,
    this.horoscope,
    this.zodiac,
    this.horoscopeIcon,
    this.zodiacIcon,
  }) : super(key: key);

  @override
  State<ProfilePictureCard> createState() => _ProfilePictureCardState();
}

class _ProfilePictureCardState extends State<ProfilePictureCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(
        height: 190,
        // width: double.infinity,
      ),
      padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(LayoutConst.spaceL),
        ),
        // image: DecorationImage(
        //   image: AssetImage("assets/images/porsche.jpg"),
        //   fit: BoxFit.cover,
        // ),
        color: cardColor,
      ),
      child: Stack(
        children: <Widget>[
          // Positioned(
          //   right: 0.0,
          //   top: 0.0,
          //   child: IconButton(
          //     icon: const Icon(
          //       Icons.edit,
          //       size: 17,
          //       // color: LinearGradient(colors: colors),
          //     ),
          //     onPressed: () {},
          //   ),
          // ),
          Positioned(
            left: 0.0,
            bottom: 0.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(
                      text: "${widget.username},",
                    ),
                    const SizedBox(width: LayoutConst.spaceM),
                    widget.age != null
                        ? CustomText(
                            text: "${widget.age}",
                          )
                        : Container(),
                  ],
                ),
                widget.gender != null
                    ? CustomText(
                        text: "${widget.gender}",
                        size: 13,
                        weight: FontWeight.w500,
                      )
                    : Container(),
                const SizedBox(height: LayoutConst.spaceM),
                Row(
                  children: [
                    widget.horoscope != null
                        ? ProfileChip(
                            icon: widget.horoscopeIcon!,
                            text: "${widget.horoscope}",
                          )
                        : Container(),
                    const SizedBox(width: LayoutConst.spaceL),
                    widget.zodiac != null
                        ? ProfileChip(
                            icon: widget.zodiacIcon!,
                            text: "${widget.zodiac}",
                          )
                        : Container(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
