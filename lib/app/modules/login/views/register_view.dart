import 'package:flutter/material.dart';

import '../../../utils/constants/layout_const.dart';
import '../../../utils/constants/text_const.dart';
import '../../../utils/helper/gradient_gold.dart';
import '../../../utils/layout/login_layout.dart';
import '../../../utils/widgets/button/primary_button.dart';
import '../../../utils/widgets/form/login_form.dart';
import '../../../utils/widgets/text/custom_text.dart';
import '../../../utils/widgets/text/gradient_text.dart';

class RegisterView extends StatefulWidget {
  // const RegisterView({super.key});
  const RegisterView({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool passwordVisible = true;
  bool confirmPasswordVisible = true;

  @override
  void initState() {
    // setLoginState(false);
    super.initState();
    passwordVisible = true;
    confirmPasswordVisible = true;
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
                text: TextConst.register,
              ),
            ],
          ),
          const SizedBox(height: LayoutConst.spaceXL),
          const LoginForm(
            hintText: TextConst.enterEmail,
          ),
          const SizedBox(height: LayoutConst.spaceL),
          const LoginForm(
            hintText: TextConst.createUsername,
          ),
          const SizedBox(height: LayoutConst.spaceL),
          LoginForm(
            hintText: TextConst.createPassword,
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
          const SizedBox(height: LayoutConst.spaceL),
          LoginForm(
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
          ),
          const SizedBox(height: LayoutConst.spaceXL),
          PrimaryButton(
            text: TextConst.register,
            onPressed: () {},
          ),
          const SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomText(
                text: TextConst.haveAccount,
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
    );
  }
}
