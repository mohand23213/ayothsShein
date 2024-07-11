import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'adminPageM.dart';

class adminPage extends StatelessWidget {
  const adminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile:adminPageM(),
      tablet: adminPageM(),
      desktop: adminPageM(),
    );
  }
}
