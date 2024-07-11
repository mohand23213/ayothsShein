import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'homePageD.dart';
import 'homePageM.dart';

class homePage extends StatelessWidget {
  const homePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile:homePageM(),
      tablet: homePageD(),
      desktop: homePageD(),
    );
  }
}
