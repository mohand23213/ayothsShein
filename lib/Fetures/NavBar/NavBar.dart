import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'NavBarDesktop.dart';
import 'NavBarM.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile:NavBarM(),
      tablet: NavBarD(),
      desktop: NavBarD(),
    );
  }
}
