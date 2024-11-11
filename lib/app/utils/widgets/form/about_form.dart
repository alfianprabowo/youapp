import 'package:flutter/material.dart';
import 'package:youapp/app/utils/constants/color_const.dart';
import 'package:youapp/app/utils/constants/text_const.dart';
import 'package:youapp/app/utils/widgets/icon/custom_icon.dart';
import 'package:youapp/app/utils/widgets/text/custom_text.dart';

import '../../../data/models/user.dart';
import '../../constants/layout_const.dart';
import 'profile_form.dart';

class AboutForm extends StatefulWidget {
  final User? user;

  const AboutForm({
    Key? key,
    this.user,
  }) : super(key: key);

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
            const Expanded(
              flex: 2,
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
              flex: 3,
              child: Column(
                children: [
                  widget.user!.name != ""
                      ? ProfileForm(
                          defaultText: widget.user!.name,
                          onChanged: (value) {},
                          actionKeyboard: TextInputAction.done,
                        )
                      : ProfileForm(
                          hintText: TextConst.enterName,
                          onChanged: (value) {},
                          actionKeyboard: TextInputAction.done,
                        )
                  // ProfileForm(
                  //   hintText: widget.user!.name ?? TextConst.enterName,
                  //   actionKeyboard: TextInputAction.next,
                  // ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: LayoutConst.spaceL),

        // > GENDER
        Row(
          children: [
            const Expanded(
              flex: 2,
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
              flex: 3,
              child: Column(
                children: [
                  // ! CHANGE TO DROPDOWN
                  ProfileForm(
                    hintText: TextConst.selectGender,
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_drop_down),
                    ),
                    readOnly: true,
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
            const Expanded(
              flex: 2,
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
              flex: 3,
              child: Column(
                children: [
                  // ! CHANGE TO BUTTON
                  widget.user!.birthday != ""
                      ? ProfileForm(
                          defaultText: widget.user!.birthday.toString(),
                          onChanged: (value) {},
                          readOnly: true,
                          onFieldTap: () {},
                        )
                      : ProfileForm(
                          hintText: TextConst.dateFormat,
                          onChanged: (value) {},
                          readOnly: true,
                        )
                  // ProfileForm(
                  //   hintText: widget.user!.birthday ?? TextConst.dateFormat,
                  //   readOnly: true,
                  //   onFieldTap: () {
                  //     debugPrint("------- birthday tapped");
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: LayoutConst.spaceL),

        // > HOROSCOPE
        Row(
          children: [
            const Expanded(
              flex: 2,
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
              flex: 3,
              child: Column(
                children: [
                  // ! GET FROM GETPROFILE
                  widget.user!.horoscope != ""
                      ? ProfileForm(
                          defaultText: widget.user!.horoscope,
                          onChanged: (value) {},
                          actionKeyboard: TextInputAction.done,
                        )
                      : ProfileForm(
                          hintText: "--",
                          onChanged: (value) {},
                          actionKeyboard: TextInputAction.done,
                        )
                  // ProfileForm(
                  //   hintText: widget.user!.horoscope ?? "--",
                  //   readOnly: true,
                  // ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: LayoutConst.spaceL),

        // > ZODIAC
        Row(
          children: [
            const Expanded(
              flex: 2,
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
              flex: 3,
              child: Column(
                children: [
                  // ! GET FROM GETPROFILE
                  widget.user!.zodiac != ""
                      ? ProfileForm(
                          defaultText: widget.user!.zodiac,
                          onChanged: (value) {},
                          actionKeyboard: TextInputAction.done,
                        )
                      : ProfileForm(
                          hintText: "--",
                          onChanged: (value) {},
                          actionKeyboard: TextInputAction.done,
                        )
                  // ProfileForm(
                  //   hintText: widget.user!.zodiac ?? "--",
                  //   readOnly: true,
                  // ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: LayoutConst.spaceL),

        // > HEIGHT
        Row(
          children: [
            const Expanded(
              flex: 2,
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
              flex: 3,
              child: Column(
                children: [
                  widget.user!.height != 0
                      ? ProfileForm(
                          defaultText: widget.user!.height.toString(),
                          onChanged: (value) {},
                          textInputType: TextInputType.number,
                          actionKeyboard: TextInputAction.next,
                          suffixText: "cm",
                        )
                      : ProfileForm(
                          hintText: TextConst.addHeight,
                          onChanged: (value) {},
                          textInputType: TextInputType.number,
                          actionKeyboard: TextInputAction.next,
                          suffixText: "cm",
                        )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: LayoutConst.spaceL),

        // > WEIGHT
        Row(
          children: [
            const Expanded(
              flex: 2,
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
              flex: 3,
              child: Column(
                children: [
                  widget.user!.weight != 0
                      ? ProfileForm(
                          defaultText: widget.user!.weight.toString(),
                          onChanged: (value) {},
                          textInputType: TextInputType.number,
                          actionKeyboard: TextInputAction.done,
                          suffixText: "kg",
                        )
                      : ProfileForm(
                          hintText: TextConst.addWeight,
                          onChanged: (value) {},
                          textInputType: TextInputType.number,
                          actionKeyboard: TextInputAction.done,
                          suffixText: "kg",
                        )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
