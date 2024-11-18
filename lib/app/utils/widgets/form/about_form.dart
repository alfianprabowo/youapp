import 'package:flutter/material.dart';
import 'package:youapp/app/utils/constants/color_const.dart';
import 'package:youapp/app/utils/constants/text_const.dart';
import 'package:youapp/app/utils/helper/format_date.dart';
import 'package:youapp/app/utils/widgets/icon/custom_icon.dart';
import 'package:youapp/app/utils/widgets/text/custom_text.dart';

import '../../../data/models/user.dart';
import '../../constants/layout_const.dart';
import 'profile_form.dart';

class AboutForm extends StatefulWidget {
  final User? user;
  final TextEditingController? nameController;
  final TextEditingController? birthdayController;
  final TextEditingController? heightController;
  final TextEditingController? weightController;
  final GlobalKey<FormState>? formKey;

  const AboutForm({
    Key? key,
    this.user,
    this.nameController,
    this.birthdayController,
    this.heightController,
    this.weightController,
    this.formKey,
  }) : super(key: key);

  @override
  State<AboutForm> createState() => _AboutFormState();
}

class _AboutFormState extends State<AboutForm> {
  DateTime now = DateTime.now();
  late String name;
  late String birthday;
  late String horoscope;
  late String zodiac;
  late int height;
  late int weight;
  String selectedBirthday = "";

  @override
  void initState() {
    super.initState();
    name = widget.user!.name ?? "";
    birthday = widget.user!.birthday ?? "";
    horoscope = widget.user!.horoscope ?? "";
    zodiac = widget.user!.zodiac ?? "";
    height = widget.user!.height ?? 0;
    weight = widget.user!.weight ?? 0;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    selectBirthday() async {
      final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        lastDate: now,
      );
      if (picked != null) {
        setState(() {
          selectedBirthday = FormatDate.format(picked);
          birthday = FormatDate.format(picked);
          widget.birthdayController?.text = selectedBirthday;
        });
      }
    }

    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          // > Image
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
                    // widget.user!.name != null && widget.user!.name != ""
                    name != ""
                        ? ProfileForm(
                            hintText: name,
                            hintStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                            functionValidate: (value) {
                              if (name != "") {
                                return null;
                              } else if (value == null || value.isEmpty) {
                                return 'Name cannot be empty';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              setState(() {
                                name = value!;
                              });
                            },
                            actionKeyboard: TextInputAction.done,
                            controller: widget.nameController,
                          )
                        : ProfileForm(
                            hintText: TextConst.enterName,
                            onChanged: (value) {},
                            actionKeyboard: TextInputAction.done,
                            controller: widget.nameController,
                            functionValidate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Name cannot be empty';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              setState(() {
                                name = value!;
                              });
                            },
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
                      readOnly: true,
                      suffixIcon: const Icon(Icons.arrow_drop_down),
                      onFieldTap: () {
                        debugPrint("------- gender tapped");
                      },
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
                    selectedBirthday != "" || birthday != ""
                        ? ProfileForm(
                            controller: widget.birthdayController,
                            hintText: birthday != "" ? birthday : selectedBirthday,
                            hintStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                            readOnly: true,
                            onFieldTap: () {
                              selectBirthday();
                            },
                            functionValidate: (value) {
                              if (selectedBirthday == "" && birthday == "") {
                                return 'Birthday cannot be empty';
                              }
                              return null;
                            },
                          )
                        : ProfileForm(
                            controller: widget.birthdayController,
                            hintText: TextConst.dateFormat,
                            readOnly: true,
                            onFieldTap: () {
                              selectBirthday();
                            },
                            functionValidate: (value) {
                              if (selectedBirthday == "") {
                                return 'Birthday cannot be empty';
                              }
                              return null;
                            },
                          )
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
                    // widget.user!.horoscope != ""
                    horoscope != ""
                        ? ProfileForm(
                            defaultText: horoscope,
                            onChanged: (value) {},
                            readOnly: true,
                          )
                        : ProfileForm(
                            hintText: "--",
                            onChanged: (value) {},
                            readOnly: true,
                          )
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
                    // widget.user!.zodiac != ""
                    zodiac != ""
                        ? ProfileForm(
                            defaultText: zodiac,
                            onChanged: (value) {},
                            readOnly: true,
                          )
                        : ProfileForm(
                            hintText: "--",
                            onChanged: (value) {},
                            readOnly: true,
                          )
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
                    // widget.user!.height != null && widget.user!.height != 0
                    height != 0
                        ? ProfileForm(
                            hintText: height.toString(),
                            hintStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                            textInputType: TextInputType.number,
                            actionKeyboard: TextInputAction.next,
                            suffixText: "cm",
                            controller: widget.heightController,
                            functionValidate: (value) {
                              if (height == 0) {
                                return 'Height cannot be empty';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              if (value != null || value!.isEmpty) {
                                debugPrint("=========== height val $value");

                                // height = int.parse(value!);
                              }
                            },
                          )
                        : ProfileForm(
                            hintText: TextConst.addHeight,
                            textInputType: TextInputType.number,
                            actionKeyboard: TextInputAction.next,
                            suffixText: "cm",
                            controller: widget.heightController,
                            functionValidate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Height cannot be empty';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              height = int.parse(value!);
                            },
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
                    // widget.user!.weight != 0 && widget.user!.weight != null
                    weight != 0
                        ? ProfileForm(
                            hintText: weight.toString(),
                            hintStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 13.0,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1.2,
                            ),
                            textInputType: TextInputType.number,
                            actionKeyboard: TextInputAction.done,
                            suffixText: "kg",
                            controller: widget.weightController,
                            functionValidate: (value) {
                              if (weight == 0) {
                                return 'Weight cannot be empty';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              if (value != null || value!.isEmpty) {
                                debugPrint("=========== weight val $value");
                                // weight = int.parse(value!);
                              }
                            },
                          )
                        : ProfileForm(
                            hintText: TextConst.addWeight,
                            textInputType: TextInputType.number,
                            actionKeyboard: TextInputAction.done,
                            suffixText: "kg",
                            controller: widget.weightController,
                            functionValidate: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Weight cannot be empty';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              weight = int.parse(value!);
                            },
                          )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
