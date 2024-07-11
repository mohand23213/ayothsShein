import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'addItemD.dart';
import 'addItemM.dart';

class addItem extends StatelessWidget {
  const addItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile:addItemM(),
      tablet: addItemD(),
      desktop: addItemD(),
    );
  }
}
