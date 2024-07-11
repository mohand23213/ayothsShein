import 'package:ayooshshein/Fetures/profile/profileD.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'profileM.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile:profileM(),
      tablet: profileM(),
      desktop: profileD(),
    );
  }
}
