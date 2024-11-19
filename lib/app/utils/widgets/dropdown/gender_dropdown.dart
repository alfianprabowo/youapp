import 'package:flutter/material.dart';
import 'package:youapp/app/utils/constants/color_const.dart';

import '../../helper/gradient_color.dart';
import '../text/custom_text.dart';
import '../text/gradient_text.dart';

class GenderDropdown extends StatefulWidget {
  const GenderDropdown({Key? key}) : super(key: key);

  @override
  State<GenderDropdown> createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  List<Gender> gender = [];

  @override
  void initState() {
    super.initState();
    gender.add(Gender(false, "Male"));
    gender.add(Gender(false, "Female"));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 36),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              const Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: "Select Gender",
                  size: 12,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      // gender = "";
                      Navigator.pop(context);
                    });
                  },
                  child: GradientText(
                    text: "Select",
                    gradient: gradientblue,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 80,
            child: ListView.builder(
              itemCount: gender.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(
                      () {
                        for (var element in gender) {
                          element.isSelected = false;
                        }
                        gender[index].isSelected = true;
                      },
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        decoration: gender[index].isSelected
                            ? const BoxDecoration(
                                color: Color.fromRGBO(255, 255, 255, 0.1),
                                borderRadius: BorderRadius.all(Radius.circular(8)),
                              )
                            : null,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            gender[index].isSelected
                                ? GradientText(
                                    text: gender[index].text,
                                    gradient: gradientGold,
                                    style: const TextStyle(
                                      fontSize: 16,
                                    ),
                                  )
                                : CustomText(
                                    text: gender[index].text,
                                  )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Gender {
  bool isSelected;
  final String text;
  Gender(
    this.isSelected,
    this.text,
  );
}
