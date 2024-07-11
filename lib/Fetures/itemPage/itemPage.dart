import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'itemPageM.dart';

class itemPage extends StatelessWidget {
  const itemPage({super.key, this.doc});
  final doc;
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile:itemPageM(doc: doc,),
      tablet: itemPageM(doc: doc,),
      desktop: itemPageM(doc: doc,),
    );
  }
}
