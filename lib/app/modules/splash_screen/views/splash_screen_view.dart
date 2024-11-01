import 'package:flutter/material.dart';

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
      // backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Container(

            // child:
            ),
      ),
    );
  }
}
