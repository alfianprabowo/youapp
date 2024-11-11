import 'package:flutter/material.dart';
import 'package:youapp/app/utils/constants/text_const.dart';
import 'package:youapp/app/utils/widgets/text/custom_text.dart';

import '../../../../utils/constants/layout_const.dart';
import '../../../../utils/helper/calculate_age.dart';

class AboutData extends StatelessWidget {
  final String? birthday, horoscope, zodiac;
  final int? height, weight;
  final int? age;

  const AboutData({
    Key? key,
    this.birthday,
    this.age,
    this.horoscope,
    this.zodiac,
    this.height,
    this.weight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // // Birthday
        Row(
          children: [
            const CustomText(
              text: "${TextConst.birthday}: ",
              size: 13,
              weight: FontWeight.w500,
              color: Color.fromRGBO(255, 255, 255, 0.33),
            ),
            CustomText(
              text: "$birthday (Age $age)",
              size: 13,
              weight: FontWeight.w500,
            ),
          ],
        ),

        const SizedBox(height: LayoutConst.spaceL),

        // // Horoscope
        Row(
          children: [
            const CustomText(
              text: "${TextConst.horoscope}: ",
              size: 13,
              weight: FontWeight.w500,
              color: Color.fromRGBO(255, 255, 255, 0.33),
            ),
            CustomText(
              text: horoscope!,
              size: 13,
              weight: FontWeight.w500,
            ),
          ],
        ),

        const SizedBox(height: LayoutConst.spaceL),

        // // Zodiac
        Row(
          children: [
            const CustomText(
              text: "${TextConst.zodiac}: ",
              size: 13,
              weight: FontWeight.w500,
              color: Color.fromRGBO(255, 255, 255, 0.33),
            ),
            CustomText(
              text: zodiac!,
              size: 13,
              weight: FontWeight.w500,
            ),
          ],
        ),

        const SizedBox(height: LayoutConst.spaceL),

        // // Height
        Row(
          children: [
            const CustomText(
              text: "${TextConst.height}: ",
              size: 13,
              weight: FontWeight.w500,
              color: Color.fromRGBO(255, 255, 255, 0.33),
            ),
            CustomText(
              text: "${height!} cm",
              size: 13,
              weight: FontWeight.w500,
            ),
          ],
        ),

        const SizedBox(height: LayoutConst.spaceL),

        // // Weight
        Row(
          children: [
            const CustomText(
              text: "${TextConst.weight}: ",
              size: 13,
              weight: FontWeight.w500,
              color: Color.fromRGBO(255, 255, 255, 0.33),
            ),
            CustomText(
              text: "${weight!} kg",
              size: 13,
              weight: FontWeight.w500,
            ),
          ],
        ),
      ],
    );
  }
}
