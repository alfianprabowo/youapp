import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp/app/modules/login/cubit/login_cubit.dart';
import 'package:youapp/app/modules/login/cubit/login_state.dart';
import 'package:youapp/app/modules/login/repositories/login_repository.dart';
import 'package:youapp/app/modules/profile/home/views/profile_view.dart';
import 'package:youapp/app/utils/constants/layout_const.dart';
import 'package:youapp/app/utils/constants/text_const.dart';
import 'package:youapp/app/utils/helper/gradient_color.dart';
import 'package:youapp/app/utils/layout/login_layout.dart';
import 'package:youapp/app/utils/widgets/button/primary_button.dart';
import 'package:youapp/app/utils/widgets/form/login_form.dart';
import 'package:youapp/app/utils/widgets/text/custom_text.dart';
import 'package:youapp/app/utils/widgets/text/gradient_text.dart';

import '../../../../config/routes/page_routes.dart';
import '../../../utils/widgets/snackbar/short_snackbar.dart';
import 'register_view.dart';

class LoginView extends StatefulWidget {
  // const LoginView({super.key});

  const LoginView({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController usernameEmailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool passwordVisible = true;

  String email = "";
  String password = "";

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
  }

  @override
  void dispose() {
    super.dispose();
    usernameEmailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoginLayout(
      child: BlocProvider<LoginCubit>(
        create: (context) => LoginCubit(LoginRepository(context)),
        child: Stack(
          children: [
            BlocConsumer<LoginCubit, LoginState>(
              builder: (context, state) => Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomText(
                          text: TextConst.login,
                        ),
                      ],
                    ),
                    const SizedBox(height: LayoutConst.spaceXL),

                    // > USERNAME / EMAIL
                    LoginForm(
                      hintText: TextConst.enterUsernameEmail,
                      textInputType: TextInputType.emailAddress,
                      controller: usernameEmailController,
                      autoValidate: AutovalidateMode.onUserInteraction,
                      functionValidate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username/Email cannot be empty';
                        }
                        return null;
                      },
                      onSaved: (val) {
                        email = val!;
                      },
                      actionKeyboard: TextInputAction.next,
                    ),
                    const SizedBox(height: LayoutConst.spaceL),

                    // > PASSWORD
                    LoginForm(
                      controller: passwordController,
                      hintText: TextConst.enterPassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          passwordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              passwordVisible = !passwordVisible;
                            },
                          );
                        },
                      ),
                      obscureText: passwordVisible,
                      textInputType: TextInputType.visiblePassword,
                      autoValidate: AutovalidateMode.onUserInteraction,
                      functionValidate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password cannot be empty';
                        }
                        if (value.length < 8) {
                          return 'password must be longer than or equal to 8 characters';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        password = value!;
                      },
                      actionKeyboard: TextInputAction.done,
                    ),
                    const SizedBox(height: LayoutConst.spaceXL),

                    // > LOGIN BUTTON
                    PrimaryButton(
                      text: TextConst.login,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState?.save();
                          // BlocProvider.of<LoginCubit>(context).login(
                          //   "prabowo",
                          //   "prabowo123",
                          // );
                          BlocProvider.of<LoginCubit>(context).login(
                            "bowo",
                            "bowo1234",
                          );
                          // BlocProvider.of<LoginCubit>(context).login(
                          //   "set",
                          //   "test1234",
                          // );
                          // BlocProvider.of<LoginCubit>(context).login(
                          //   email,
                          //   password,
                          // );
                        }
                      },
                    ),
                    const SizedBox(height: 50),

                    // > REGISTER BUTTON
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomText(
                          text: TextConst.noAccount,
                          size: 13,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterView(),
                              ),
                            );
                          },
                          child: GradientText(
                            text: TextConst.registerHere,
                            gradient: gradientGold,
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              listener: (context, state) {
                if (state is SuccessLoginState) {
                  shortSnackBar(context, state.successMessage!);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    PageRoutes.profileView,
                    (Route<dynamic> route) => false,
                  );
                } else if (state is FailureLoginState) {
                  if (state.errorMessage != null) {
                    shortSnackBar(context, state.errorMessage!);
                  }
                }
              },
            ),
            BlocConsumer<LoginCubit, LoginState>(
              builder: (context, state) {
                if (state is LoadingLoginState) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
              listener: (context, state) {},
            ),
          ],
        ),
      ),
    );
  }
}
