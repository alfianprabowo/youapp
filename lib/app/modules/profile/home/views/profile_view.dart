import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:youapp/app/modules/profile/home/cubit/profile_state.dart';
import 'package:youapp/app/modules/profile/home/repositories/profile_repository.dart';
import 'package:youapp/app/modules/profile/home/views/about_data.dart';
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
import 'package:youapp/config/environment/secure_storage_service.dart';

import '../../../../../config/routes/page_routes.dart';
import '../../../../data/models/user.dart';
import '../../../../utils/constants/app_const.dart';
import '../../../../utils/helper/calculate_age.dart';
import '../../../../utils/helper/format_date.dart';
import '../../../../utils/helper/gradient_color.dart';
import '../../../../utils/widgets/custom_appbar.dart';
import '../../../../utils/widgets/text/gradient_text.dart';
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
    setLoginState(false);
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
                acionPressed: logout,
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(LayoutConst.spaceL),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // > TEST
                      // Wrap(
                      //   alignment: WrapAlignment.start,
                      //   runAlignment: WrapAlignment.start,
                      //   crossAxisAlignment: WrapCrossAlignment.start,
                      //   runSpacing: 10,
                      //   spacing: 10,
                      //   children: List.generate(
                      //     state.allValues!.length,
                      //     (index) {
                      //       return CustomText(
                      //         text: state.allValues!.toString(),
                      //       );
                      //     },
                      //   ),
                      // ),

                      // > TEST

                      // > PROFILE PICTURE
                      ProfilePictureCard(
                        username: state.username,
                        age: state.age!,
                        // gender: state.gender,
                        horoscope: state.horoscope ?? "",
                        zodiac: state.zodiac ?? "",
                      ),

                      const SizedBox(height: LayoutConst.spaceXL),

                      // > ABOUT
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
                            ? AboutForm(
                                user: User(
                                name: state.name ?? "",
                                birthday: state.birthday ?? "",
                                horoscope: state.horoscope ?? "",
                                zodiac: state.zodiac ?? "",
                                height: state.height ?? 0,
                                weight: state.weight ?? 0,
                              ))
                            : state.name != ""
                                ? AboutData(
                                    birthday: state.birthday ?? "",
                                    age: state.age ?? 0,
                                    horoscope: state.horoscope ?? "",
                                    zodiac: state.zodiac ?? "",
                                    height: state.height ?? 0,
                                    weight: state.weight ?? 0,
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

                      // > INTEREST
                      ProfileCard(
                        title: TextConst.interest,
                        action: IconButton(
                          icon: const Icon(
                            Icons.edit,
                            size: 17,
                          ),
                          onPressed: () async {
                            await Navigator.pushNamed(
                              context,
                              PageRoutes.updateInterestView,
                            );
                          },
                        ),
                        body: state.interests!.isNotEmpty
                            ? Wrap(
                                alignment: WrapAlignment.start,
                                runAlignment: WrapAlignment.start,
                                crossAxisAlignment: WrapCrossAlignment.start,
                                runSpacing: 10,
                                spacing: 10,
                                children: List.generate(
                                  state.interests!.length,
                                  (index) {
                                    return InterestChip(
                                      text: state.interests![index],
                                    );
                                  },
                                ),
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
            return Scaffold(
              body: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
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
            logout();
          }
        },
      ),
    );
  }

  logout() {
    deleteAll();
    Navigator.of(context).pushNamedAndRemoveUntil(PageRoutes.loginView, (Route<dynamic> route) => false);
  }
}
