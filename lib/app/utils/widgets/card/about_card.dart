import 'package:flutter/material.dart';

class AboutCard extends StatefulWidget {
  const AboutCard({
    Key? key,
  }) : super(key: key);

  @override
  State<AboutCard> createState() => _AboutCardState();
}

class _AboutCardState extends State<AboutCard> {
  bool isUpdating = false;

  @override
  void initState() {
    super.initState();
    isUpdating = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
