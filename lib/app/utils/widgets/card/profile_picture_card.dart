import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:youapp/app/utils/constants/color_const.dart';
import 'package:youapp/app/utils/constants/layout_const.dart';
import 'package:youapp/app/utils/widgets/chip/profile_chip.dart';
import 'package:youapp/app/utils/widgets/text/custom_text.dart';

class ProfilePictureCard extends StatefulWidget {
  // const ProfilePictureCard({super.key});
  final String? username;
  final int? age;
  final String? image;
  final String? gender;
  final String? horoscope;
  final String? zodiac;

  const ProfilePictureCard({
    Key? key,
    this.username,
    this.age,
    this.image,
    this.gender,
    this.horoscope,
    this.zodiac,
  }) : super(key: key);

  @override
  State<ProfilePictureCard> createState() => _ProfilePictureCardState();
}

class _ProfilePictureCardState extends State<ProfilePictureCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 190,
        maxHeight: 190,
        minWidth: 0,
        maxWidth: 400,
      ),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(LayoutConst.spaceL),
        ),
        color: cardColor,
      ),
      child: Stack(
        children: <Widget>[
          widget.image != null
              ? CachedNetworkImage(
                  imageUrl: widget.image ?? "",
                  imageBuilder: (context, imageProvider) => Container(
                    decoration: BoxDecoration(
                      // shape: BoxShape.values[0.2],
                      borderRadius: const BorderRadius.all(
                        Radius.circular(LayoutConst.spaceL),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: imageProvider,
                      ),
                    ),
                  ),
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => Container(),
                )
              : Container(),

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
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      widget.username != ""
                          ? CustomText(
                              text: "@${widget.username},",
                            )
                          : Container(),
                      const SizedBox(width: LayoutConst.spaceM),
                      widget.age != 0
                          ? CustomText(
                              text: "${widget.age}",
                            )
                          : Container(),
                    ],
                  ),
                  widget.gender != null
                      ? CustomText(
                          text: widget.gender ?? "",
                          size: 13,
                          weight: FontWeight.w500,
                        )
                      : Container(),
                  const SizedBox(height: LayoutConst.spaceM),
                  Row(
                    children: [
                      // widget.horoscope != "Error" || widget.horoscope != ""
                      widget.horoscope != null
                          ? ProfileChip(
                              icon: widget.horoscope ?? "",
                              text: "${widget.horoscope}",
                            )
                          : Container(),
                      const SizedBox(width: LayoutConst.spaceL),
                      widget.zodiac != null
                          ? ProfileChip(
                              icon: widget.zodiac ?? "",
                              text: "${widget.zodiac}",
                            )
                          : Container(),
                    ],
                  )
                  // widget.horoscope != "" || widget.horoscope != "Error" || widget.zodiac != "" || widget.zodiac != "Error"
                  //     ? Row(
                  //         children: [
                  //           ProfileChip(
                  //             icon: widget.horoscope ?? "",
                  //             text: "${widget.horoscope}",
                  //           ),
                  //           const SizedBox(width: LayoutConst.spaceL),
                  //           ProfileChip(
                  //             icon: widget.zodiac ?? "",
                  //             text: "${widget.zodiac}",
                  //           )
                  //         ],
                  //       )
                  //     : Container(),

                  // widget.horoscope != null || widget.horoscope != ""
                  //     ? Row(
                  //         children: [
                  //           widget.horoscope != null
                  //               ? ProfileChip(
                  //                   icon: widget.horoscope ?? "",
                  //                   text: "${widget.horoscope}",
                  //                 )
                  //               : Container(),
                  //           const SizedBox(width: LayoutConst.spaceL),
                  //           widget.zodiac != null
                  //               ? ProfileChip(
                  //                   icon: widget.zodiac ?? "",
                  //                   text: "${widget.zodiac}",
                  //                 )
                  //               : Container(),
                  //         ],
                  //       )
                  //     : Container(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
