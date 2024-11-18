import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp/app/data/models/interest_list.dart';
import 'package:youapp/app/modules/profile/home/views/profile_view.dart';
import 'package:youapp/app/utils/helper/gradient_color.dart';
import 'package:youapp/app/utils/widgets/chip/create_interest_chip.dart';
import 'package:youapp/app/utils/widgets/text/custom_text.dart';

import '../../../../data/models/user.dart';
import '../../../../utils/constants/color_const.dart';
import '../../../../utils/constants/layout_const.dart';
import '../../../../utils/constants/text_const.dart';
import '../../../../utils/widgets/snackbar/short_snackbar.dart';
import '../../../../utils/widgets/text/gradient_text.dart';
import '../cubit/update_interest_cubit.dart';
import '../cubit/update_interest_state.dart';
import '../repositories/update_interest_repository.dart';

class UpdateInterestView extends StatefulWidget {
  final User? user;

  const UpdateInterestView({
    Key? key,
    this.user,
  }) : super(key: key);

  @override
  State<UpdateInterestView> createState() => _UpdateInterestViewState();
}

class _UpdateInterestViewState extends State<UpdateInterestView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController interestController = TextEditingController();
  BuildContext? ctxInterest;

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    var user = args['user'];
    var updateInterests = user.interests;

    addInterest(String interest) {
      updateInterests!.add(interest);
    }

    deleteInterest(String interest) {
      updateInterests!.removeWhere(
        (item) => item == interest,
      );
    }

    @override
    void initState() {
      super.initState();
    }

    @override
    void dispose() {
      super.dispose();
      interestController.dispose();
    }

    return BlocProvider<UpdateInterestCubit>(
      create: (context) => UpdateInterestCubit(UpdateInterestRepository(context)),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: TextButton(
                onPressed: () {
                  // InterestList list = InterestList(interests: updateInterests);
                  // user.interests = updateInterests;
                  // user['interests'] = updateInterests;
                  BlocProvider.of<UpdateInterestCubit>(ctxInterest!).updateInterest(user);
                },
                child: GradientText(
                  text: TextConst.save,
                  gradient: gradientblue,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          height: double.infinity,
          padding: const EdgeInsets.fromLTRB(
            LayoutConst.spaceL,
            120,
            LayoutConst.spaceL,
            20,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                primaryBackgroundColor,
                secondaryBackgroundColor,
                accentBackgroundColor,
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                BlocConsumer<UpdateInterestCubit, UpdateInterestState>(
                  builder: (context, state) => Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GradientText(
                          text: TextConst.tellYourself,
                          gradient: gradientGold,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: LayoutConst.spaceL),
                        const CustomText(
                          text: TextConst.whatInterest,
                          size: 20,
                          weight: FontWeight.w700,
                        ),
                        const SizedBox(height: LayoutConst.spaceXXL),
                        interestForm(
                          controller: interestController,
                          onEditingComplete: () {
                            setState(() {
                              addInterest(interestController.text);
                              interestController.clear();
                            });
                          },
                        ),
                        const SizedBox(height: LayoutConst.spaceL),
                        const CustomText(
                          text: "Selected Interests",
                          size: 12,
                          color: Color.fromRGBO(255, 255, 255, 0.33),
                        ),
                        const SizedBox(height: LayoutConst.spaceL),
                        BlocConsumer<UpdateInterestCubit, UpdateInterestState>(
                          builder: (context, state) {
                            ctxInterest = context;

                            if (state is LoadingUpdateInteresState) {
                              return SizedBox(
                                height: MediaQuery.of(context).size.height,
                                width: MediaQuery.of(context).size.width,
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            } else if (state is InitialUpdateInterestState) {
                              return updateInterests!.isNotEmpty
                                  ? Wrap(
                                      runSpacing: 10,
                                      spacing: 10,
                                      children: List.generate(
                                        updateInterests.length,
                                        (index) {
                                          return CreateInterestChip(
                                            // text: updateInterests[index],
                                            text: "${updateInterests.elementAt(index)}",
                                            onPressed: () {
                                              setState(() {
                                                deleteInterest(updateInterests[index]);
                                              });
                                            },
                                          );
                                        },
                                      ),
                                    )
                                  : Container();
                            } else {
                              return Container();
                            }
                          },
                          listener: (context, state) {
                            if (state is FailureUpdateInterestState) {
                              shortSnackBar(context, state.errorMessage ?? "Update failed");
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  listener: (context, state) {
                    if (state is SuccessUpdateInteresState) {
                      shortSnackBar(context, "Success update interest");
                      // Navigator.pushNamedAndRemoveUntil(
                      //   context,
                      //   PageRoutes.profileView,
                      //   (Route<dynamic> route) => false,
                      //   arguments: {
                      //     "interest": updateInterests,
                      //   },
                      // );

                      ProfileView.refreshPage.call();
                      Navigator.pop(context);
                    } else if (state is FailureUpdateInterestState) {
                      if (state.errorMessage != null) {
                        shortSnackBar(context, state.errorMessage!);
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  interestForm({
    required TextEditingController controller,
    Function? onSubmitField,
    VoidCallback? onEditingComplete,
  }) {
    return TextFormField(
      cursorColor: primaryBlueColor,
      maxLines: 1,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
      ),
      decoration: const InputDecoration(
        hintText: "e.g Music",
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(217, 217, 217, 0.06),
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: primaryBlueColor),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        hintStyle: TextStyle(
          color: Color.fromRGBO(255, 255, 255, 0.33),
          fontSize: 13.0,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.normal,
          letterSpacing: 1.2,
        ),
        filled: true,
        fillColor: Color.fromRGBO(217, 217, 217, 0.06),
        contentPadding: EdgeInsets.all(
          LayoutConst.spaceL,
        ),
        isDense: true,
        errorStyle: TextStyle(
          color: Colors.redAccent,
          fontSize: 12.0,
          fontWeight: FontWeight.w300,
          fontStyle: FontStyle.normal,
          letterSpacing: 1.2,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.redAccent),
        ),
      ),
      textCapitalization: TextCapitalization.sentences,
      controller: controller,
      onEditingComplete: () {
        if (onEditingComplete != null) onEditingComplete.call();
      },
      onFieldSubmitted: (value) {
        if (onSubmitField != null) onSubmitField.call(value);
      },
    );
  }
}
