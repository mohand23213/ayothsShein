import 'package:ayooshshein/Fetures/record/recordM.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../services/authentication.dart';

class record extends StatelessWidget {
  const record({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile:recordM(condition:'ClientDocId',conditionValue:Provider.of<AuthServices>(context).userData.id),
      tablet: recordM(condition:'ClientDocId',conditionValue:Provider.of<AuthServices>(context).userData.id,),
      desktop: recordM(condition:'ClientDocId',conditionValue:Provider.of<AuthServices>(context).userData.id,),
    );
  }
}
