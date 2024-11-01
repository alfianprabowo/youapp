import 'package:flutter/material.dart';
import 'package:youapp/app/modules/profile/views/profile_view.dart';
import 'package:youapp/app/utils/constants/layout_const.dart';
import 'package:youapp/app/utils/constants/text_const.dart';
import 'package:youapp/app/utils/helper/gradient_gold.dart';
import 'package:youapp/app/utils/layout/login_layout.dart';
import 'package:youapp/app/utils/widgets/button/primary_button.dart';
import 'package:youapp/app/utils/widgets/form/login_form.dart';
import 'package:youapp/app/utils/widgets/text/custom_text.dart';
import 'package:youapp/app/utils/widgets/text/gradient_text.dart';

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
  bool passwordVisible = true;
  @override
  void initState() {
    // setLoginState(false);
    super.initState();
    passwordVisible = true;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LoginLayout(
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
          const LoginForm(
            hintText: TextConst.enterUsernameEmail,
          ),
          const SizedBox(height: LayoutConst.spaceL),
          LoginForm(
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
          ),
          const SizedBox(height: LayoutConst.spaceXL),
          PrimaryButton(
            text: TextConst.login,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileView()),
              );
            },
          ),
          const SizedBox(height: 50),
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
                    MaterialPageRoute(builder: (context) => const RegisterView()),
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
    );
  }
}
