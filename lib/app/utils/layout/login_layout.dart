import 'package:flutter/material.dart';

import '../constants/color_const.dart';
import '../constants/layout_const.dart';

class LoginLayout extends StatelessWidget {
  // const LoginLayout({super.key});
  final Widget child;

  const LoginLayout({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.fromLTRB(
            LayoutConst.spaceL,
            80,
            LayoutConst.spaceL,
            80,
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
          child: child,
        ),
      ),
    );
  }
}
