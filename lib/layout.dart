import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'package:facebook_clone/screens/mobile.dart';
import 'package:facebook_clone/states/scrollsize.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ScrollSize(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 900) return Container();
          return const MobileScreen();
        },
      ),
    );
  }
}
