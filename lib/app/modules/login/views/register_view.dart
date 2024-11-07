import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youapp/app/modules/login/cubit/login_cubit.dart';
import 'package:youapp/app/modules/login/views/login_view.dart';
import 'package:youapp/app/utils/helper/form_validator.dart';

import '../../../../config/routes/page_routes.dart';
import '../../../utils/constants/layout_const.dart';
import '../../../utils/constants/text_const.dart';
import '../../../utils/helper/gradient_gold.dart';
import '../../../utils/layout/login_layout.dart';
import '../../../utils/widgets/button/primary_button.dart';
import '../../../utils/widgets/form/login_form.dart';
import '../../../utils/widgets/snackbar/short_snackbar.dart';
import '../../../utils/widgets/text/custom_text.dart';
import '../../../utils/widgets/text/gradient_text.dart';
import '../cubit/login_state.dart';
import '../repositories/login_repository.dart';

class RegisterView extends StatefulWidget {
  // const RegisterView({super.key});
  const RegisterView({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmasswordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool passwordVisible = true;
  bool confirmPasswordVisible = true;

  String email = "";
  String username = "";
  String password = "";
  String confirmPassword = "";

  @override
  void initState() {
    // setLoginState(false);
    super.initState();
    passwordVisible = true;
    confirmPasswordVisible = true;
  }

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    confirmasswordController.dispose();
    super.dispose();
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
                          text: TextConst.register,
                        ),
                      ],
                    ),
                    const SizedBox(height: LayoutConst.spaceXL),

                    // > EMAIL
                    LoginForm(
                      controller: emailController,
                      hintText: TextConst.enterEmail,
                      textInputType: TextInputType.emailAddress,
                      autoValidate: AutovalidateMode.onUserInteraction,
                      functionValidate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email cannot be empty';
                        }
                        if (!value.isValidEmail) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        email = val;
                      },
                      onSaved: (val) {
                        email = val!;
                      },
                    ),
                    const SizedBox(height: LayoutConst.spaceL),

                    // > USERNAME
                    LoginForm(
                      controller: usernameController,
                      hintText: TextConst.createUsername,
                      textInputType: TextInputType.name,
                      functionValidate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Username cannot be empty';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        username = val;
                      },
                      onSaved: (val) {
                        username = val!;
                      },
                    ),
                    const SizedBox(height: LayoutConst.spaceL),

                    // > PASSWORD
                    LoginForm(
                      controller: passwordController,
                      hintText: TextConst.createPassword,
                      autoValidate: AutovalidateMode.onUserInteraction,
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
                      functionValidate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password cannot be empty';
                        }
                        if (value.length < 8) {
                          return 'password must be longer than or equal to 8 characters';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        password = value;
                      },
                      onSaved: (value) {
                        password = value!;
                      },
                    ),
                    const SizedBox(height: LayoutConst.spaceL),

                    // > CONFIRM PASSWORD
                    LoginForm(
                      controller: confirmasswordController,
                      hintText: TextConst.confirmPassword,
                      suffixIcon: IconButton(
                        icon: Icon(
                          confirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              confirmPasswordVisible = !confirmPasswordVisible;
                            },
                          );
                        },
                      ),
                      obscureText: confirmPasswordVisible,
                      textInputType: TextInputType.visiblePassword,
                      autoValidate: AutovalidateMode.onUserInteraction,
                      functionValidate: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please confirm password';
                        }
                        if (value.length < 8) {
                          return 'password must be longer than or equal to 8 characters';
                        }
                        if (value != password) {
                          return 'The password you entered is different';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        confirmPassword = value;
                      },
                      onSaved: (value) {
                        confirmPassword = value!;
                      },
                    ),
                    const SizedBox(height: LayoutConst.spaceXL),

                    // > REGISTER BUTTON
                    PrimaryButton(
                      text: TextConst.register,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState?.save();
                          BlocProvider.of<LoginCubit>(context).register(
                            email,
                            username,
                            password,
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 50),

                    // > LOGIN PAGE
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomText(
                          text: TextConst.haveAccount,
                          size: 13,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              PageRoutes.loginView,
                              (Route<dynamic> route) => false,
                            );
                          },
                          child: GradientText(
                            text: TextConst.loginHere,
                            gradient: gradientGold,
                            style: const TextStyle(
                              decoration: TextDecoration.underline,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    )
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
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black.withOpacity(0.1),
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
