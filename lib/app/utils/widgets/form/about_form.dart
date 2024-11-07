import 'package:flutter/material.dart';
import 'package:youapp/app/utils/constants/color_const.dart';
import 'package:youapp/app/utils/constants/text_const.dart';
import 'package:youapp/app/utils/widgets/icon/custom_icon.dart';
import 'package:youapp/app/utils/widgets/text/custom_text.dart';

import '../../constants/layout_const.dart';
import 'profile_form.dart';

class AboutForm extends StatefulWidget {
  // ! USER DATA

  const AboutForm({Key? key}) : super(key: key);

  @override
  State<AboutForm> createState() => _AboutFormState();
}

class _AboutFormState extends State<AboutForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(17),
              child: Container(
                height: 57,
                width: 57,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: const Color.fromRGBO(255, 255, 255, 0.08),
                ),
                child: const Center(
                  child: CustomIcon(
                    icon: Icons.add,
                    size: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(width: LayoutConst.spaceL),
            const CustomText(
              text: TextConst.addImage,
              size: 12,
              weight: FontWeight.w500,
            )
          ],
        ),
        const SizedBox(height: LayoutConst.spaceL),

        // > NAME
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "${TextConst.displayName}:",
                    size: 13,
                    weight: FontWeight.w500,
                    color: labelTextColor,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  ProfileForm(
                    hintText: TextConst.enterName,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: LayoutConst.spaceL),

        // > GENDER
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "${TextConst.gender}:",
                    size: 13,
                    weight: FontWeight.w500,
                    color: labelTextColor,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  // ! CHANGE TO DROPDOWN
                  ProfileForm(
                    hintText: TextConst.selectGender,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_drop_down),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: LayoutConst.spaceL),

        // > BIRTHDAY
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "${TextConst.birthday}:",
                    size: 13,
                    weight: FontWeight.w500,
                    color: labelTextColor,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  // ! CHANGE TO BUTTON
                  ProfileForm(
                    hintText: TextConst.dateFormat,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: LayoutConst.spaceL),

        // > HOROSCOPE
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "${TextConst.horoscope}:",
                    size: 13,
                    weight: FontWeight.w500,
                    color: labelTextColor,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  // ! GET FROM GETPROFILE
                  ProfileForm(
                    hintText: "--",
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: LayoutConst.spaceL),

        // > ZODIAC
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "${TextConst.zodiac}:",
                    size: 13,
                    weight: FontWeight.w500,
                    color: labelTextColor,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  // ! GET FROM GETPROFILE
                  ProfileForm(
                    hintText: "--",
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: LayoutConst.spaceL),

        // > HEIGHT
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "${TextConst.height}:",
                    size: 13,
                    weight: FontWeight.w500,
                    color: labelTextColor,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  ProfileForm(
                    hintText: TextConst.addHeight,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: LayoutConst.spaceL),

        // > WEIGHT
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: "${TextConst.weight}:",
                    size: 13,
                    weight: FontWeight.w500,
                    color: labelTextColor,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  ProfileForm(
                    hintText: TextConst.addWeight,
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
