import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp/app/utils/constants/app_const.dart';
import 'package:youapp/app/utils/widgets/text/custom_text.dart';

import '../../../../config/routes/page_routes.dart';
import '../../../utils/constants/color_const.dart';
import '../cubit/is_login_cubit.dart';
import '../cubit/is_login_state.dart';

class SplasScreenView extends StatefulWidget {
  const SplasScreenView({Key? key}) : super(key: key);

  @override
  State<SplasScreenView> createState() => _SplasScreenViewState();
}

class _SplasScreenViewState extends State<SplasScreenView> {
  @override
  Widget build(BuildContext context) {
    //  ScreenUtil.init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
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
          child: BlocProvider<IsLoginCubit>(
            create: (context) => IsLoginCubit(),
            child: BlocListener<IsLoginCubit, IsLoginState>(
              listener: (context, state) {
                if (state is ResultLoginState) {
                  if (state.status) {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      PageRoutes.profileView,
                      (Route<dynamic> route) => false,
                    );
                  } else {
                    Navigator.popAndPushNamed(context, PageRoutes.loginView);
                  }
                }
              },
              child: const Center(
                child: CustomText(
                  text: appName,
                  size: 32,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
