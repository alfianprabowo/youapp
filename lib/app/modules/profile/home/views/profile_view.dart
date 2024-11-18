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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  @override
  void initState() {
    setLoginState(false);
    super.initState();
    isUpdating = false;
    ProfileView.refreshPage = () {
      Future(() => refresh());
    };
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    birthdayController.dispose();
    heightController.dispose();
    weightController.dispose();
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
  Widget build(BuildContext context) {
    ProfileView.refreshPage = () {
      refresh();
    };
    String name;
    String birthday;
    int height;
    int weight;
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
                      // > PROFILE PICTURE
                      ProfilePictureCard(
                        username: state.username,
                        age: state.age ?? 0,
                        // gender: state.gender,
                        horoscope: state.horoscope ?? "",
                        zodiac: state.zodiac ?? "",
                      ),

                      const SizedBox(height: LayoutConst.spaceXL),

                      // > ABOUT

                      state.isUpdating
                          ? ProfileCard(
                              title: TextConst.about,
                              action: TextButton(
                                onPressed: () {
                                  // isUpdating = false;
                                  if (formKey.currentState!.validate()) {
                                    formKey.currentState?.save();

                                    name = nameController.text.isNotEmpty ? nameController.text : state.name!;
                                    birthday = birthdayController.text.isNotEmpty ? birthdayController.text : state.birthday!;
                                    height = heightController.text.isNotEmpty ? int.parse(heightController.text) : state.height!;
                                    weight = weightController.text.isNotEmpty ? int.parse(weightController.text) : state.weight!;
                                    debugPrint("-------- send user name ${name}");
                                    debugPrint("-------- send user birthday ${birthday}");
                                    // debugPrint("-------- send user birthday ${state.birthday!}");
                                    debugPrint("-------- send user height ${height}");
                                    // debugPrint("-------- send user height ${state.height}");
                                    debugPrint("-------- send user weight ${weight}");
                                    // debugPrint("-------- send user weight ${state.weight}");

                                    User data = User(
                                      name: name,
                                      birthday: birthday,
                                      height: height,
                                      weight: weight,
                                      interests: state.interests ?? [],
                                    );
                                    debugPrint("-------- data user $data");
                                    if (state.name != "") {
                                      debugPrint("-------- send user Update");
                                      // BlocProvider.of<ProfileCubit>(context, listen: false).updateProfile(data);
                                    } else {
                                      debugPrint(">>>>>>>>>>>>>>>>>>>>> send user Create");
                                      // BlocProvider.of<ProfileCubit>(context, listen: false).createProfile(data);
                                    }

                                    nameController.clear();
                                    birthdayController.clear();
                                    heightController.clear();
                                    weightController.clear();
                                    setState(() {
                                      state.isUpdating = false;
                                    });
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
                              ),
                              body: AboutForm(
                                user: User(
                                  name: state.name ?? "",
                                  birthday: state.birthday ?? "",
                                  horoscope: state.horoscope ?? "",
                                  zodiac: state.zodiac ?? "",
                                  height: state.height ?? 0,
                                  weight: state.weight ?? 0,
                                  interests: state.interests ?? [],
                                ),
                                formKey: formKey,
                                nameController: nameController,
                                birthdayController: birthdayController,
                                heightController: heightController,
                                weightController: weightController,
                              ),
                            )
                          : ProfileCard(
                              title: TextConst.about,
                              action: IconButton(
                                icon: const Icon(
                                  Icons.edit,
                                  size: 17,
                                ),
                                onPressed: () {
                                  setState(() {
                                    state.isUpdating = true;
                                  });
                                },
                              ),
                              body: state.name != null && state.name != ""
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
                              arguments: {
                                'user': User(
                                  name: state.name ?? "",
                                  birthday: state.birthday ?? "",
                                  horoscope: state.horoscope ?? "",
                                  zodiac: state.zodiac ?? "",
                                  height: state.height ?? 0,
                                  weight: state.weight ?? 0,
                                  interests: state.interests ?? [],
                                ),
                              },
                            );
                          },
                        ),
                        body: state.interests != null && state.interests!.isNotEmpty
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
            return Scaffold(
              body: SafeArea(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Your session has ended, please re-login"),
                      const SizedBox(height: LayoutConst.spaceXL),
                      ElevatedButton(
                        onPressed: () {
                          logout();
                        },
                        child: const Text(
                          "Back to Login page",
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
        },
        listener: (context, state) {
          if (state is ProfileMessage) {
            shortSnackBar(context, state.errorMessage ?? "Failed profile load");
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
