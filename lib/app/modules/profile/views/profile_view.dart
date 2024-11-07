import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp/app/modules/profile/cubit/profile_state.dart';
import 'package:youapp/app/modules/profile/repositories/profile_repository.dart';
import 'package:youapp/app/modules/profile/views/about_data.dart';
import 'package:youapp/app/utils/constants/layout_const.dart';
import 'package:youapp/app/utils/constants/text_const.dart';
import 'package:youapp/app/utils/widgets/card/profile_card.dart';
import 'package:youapp/app/utils/widgets/card/profile_picture_card.dart';
import 'package:youapp/app/utils/widgets/chip/create_interest_chip.dart';
import 'package:youapp/app/utils/widgets/chip/interest_chip.dart';
import 'package:youapp/app/utils/widgets/chip/profile_chip.dart';
import 'package:youapp/app/utils/widgets/form/about_form.dart';
import 'package:youapp/app/utils/widgets/form/profile_form.dart';
import 'package:youapp/app/utils/widgets/snackbar/short_snackbar.dart';
import 'package:youapp/app/utils/widgets/text/custom_text.dart';

import '../../../../config/routes/page_routes.dart';
import '../../../utils/constants/app_const.dart';
import '../../../utils/helper/gradient_gold.dart';
import '../../../utils/widgets/custom_appbar.dart';
import '../../../utils/widgets/text/gradient_text.dart';
import '../cubit/profile_cubit.dart';

class ProfileView extends StatefulWidget {
  static Function refreshPage = () {};

  // const ProfileView({super.key});
  const ProfileView({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  BuildContext? ctxProfile;
  bool isUpdating = false;

  @override
  void initState() {
    // setLoginState(false);
    super.initState();
    isUpdating = false;
    ProfileView.refreshPage = () {
      Future(() => refresh());
    };
  }

  refresh({Function()? function}) {
    if (mounted) {
      if (ctxProfile != null) {
        BlocProvider.of<ProfileCubit>(ctxProfile!).getProfile();
      }
      setState(() {
        function?.call();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit(ProfileRepository(context)),
        ),
      ],
      child: BlocConsumer<ProfileCubit, ProfileState>(
        builder: (context, state) {
          ctxProfile = context;
          if (state is InitialProfileState) {
            return Scaffold(
              appBar: CustomAppbar(
                username: "@${state.username}",
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(LayoutConst.spaceL),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ProfilePictureCard(
                        username: state.username,
                        age: state.age,
                        // gender: state.gender,
                        horoscope: state.horoscope,
                        horoscopeIcon: Icons.font_download,
                        zodiac: state.zodiac,
                        zodiacIcon: Icons.book,
                        // image: "https://images.pexels.com/photos/346529/pexels-photo-346529.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                      ),

                      const SizedBox(height: LayoutConst.spaceXL),
                      // AboutForm(),
                      const SizedBox(height: LayoutConst.spaceXL),
                      ProfileCard(
                        title: TextConst.about,
                        action: isUpdating
                            ? TextButton(
                                onPressed: () {
                                  setState(() {
                                    isUpdating = false;
                                  });
                                  if (state.name != "") {
                                    // BlocProvider.of<ProfileCubit>(context, listen: false).updateProfile(Profile);
                                  } else {
                                    // BlocProvider.of<ProfileCubit>(context, listen: false).createProfile(Profile);
                                  }
                                },
                                child: GradientText(
                                  text: TextConst.saveUpdate,
                                  gradient: gradientGold,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              )
                            : IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  size: 17,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isUpdating = true;
                                  });
                                },
                              ),
                        body: isUpdating
                            ? AboutForm()
                            : state.name != ""
                                ? AboutData(
                                    birthday: state.birthday,
                                    age: state.age,
                                    horoscope: state.horoscope,
                                    zodiac: state.zodiac,
                                    height: state.height,
                                    weight: state.weight,
                                  )
                                : const CustomText(
                                    text: TextConst.addAbout,
                                    size: 14,
                                    weight: FontWeight.w500,
                                  ),
                        // body: state.name != ""
                        //     ? isUpdating
                        //         ? AboutForm()
                        //         // ! CHANGE TO ABOUT DATA
                        //         : AboutData(
                        //             birthday: state.birthday,
                        //             age: state.age,
                        //             horoscope: state.horoscope,
                        //             zodiac: state.zodiac,
                        //             height: state.height,
                        //             weight: state.weight,
                        //           )
                        //     : isUpdating // ! CHANGE TO EDIT ABOUT DATA
                        //         ? AboutForm()
                        //         : const CustomText(
                        //             text: TextConst.addAbout,
                        //             size: 14,
                        //             weight: FontWeight.w500,
                        //           ),
                      ),
                      const SizedBox(height: LayoutConst.spaceXL),

                      // > Interest Card
                      ProfileCard(
                        title: TextConst.interest,
                        action: IconButton(
                          icon: const Icon(
                            Icons.edit,
                            size: 17,
                          ),
                          onPressed: () {
                            // ! POP UP FULL SCREEN FORM
                          },
                        ),
                        body: state.interests.isNotEmpty
                            // ? ListView.builder(
                            //     itemCount: widget.interest!.length,
                            //     itemBuilder: (context, index) {
                            //       var item = widget.interest![index];
                            //       return ProfileChip(
                            //         blur: false,
                            //         text: item,
                            //       );
                            //     },
                            //   )
                            ? Row(
                                children: [
                                  CreateInterestChip(
                                    text: "food",
                                    onPressed: () {
                                      print("food delete");
                                    },
                                  ),
                                  InterestChip(
                                    text: "game",
                                    onPressed: () {
                                      print("game delete");
                                    },
                                  ),
                                ],
                              )
                            : const CustomText(
                                text: TextConst.addInterest,
                                size: 14,
                                weight: FontWeight.w500,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is LoadingProfileState) {
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.black.withOpacity(0.1),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Container();
          }
        },
        listener: (context, state) {
          if (state is ProfileMessage) {
            shortSnackBar(context, state.errorMessage ?? "Gagal Logout");
          } else if (state is ProfileLogOut) {
            Navigator.of(context).pushNamedAndRemoveUntil(PageRoutes.loginView, (Route<dynamic> route) => false);
          }
        },
      ),
    );
  }
}
