import 'package:flutter/material.dart';
import 'package:youapp/app/utils/constants/layout_const.dart';
import 'package:youapp/app/utils/constants/text_const.dart';
import '../../utils/constants/color_const.dart';

class HomeView extends StatefulWidget {
  // const HomeView({super.key});
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late List<Widget> _children;
  int _selectedIndex = 0;

  bool passwordVisible = false;
  @override
  void initState() {
    // setLoginState(false);
    super.initState();
    passwordVisible = false;
    _children = [
      // const HomeUi(),
      // const Shop(),
      // const ChatUI(),
      // const Profile(),
    ];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [],
      ),
    );
  }
}
