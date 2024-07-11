import 'package:ayooshshein/Fetures/commonWiget.dart';
import 'package:ayooshshein/Fetures/record/recordM.dart';
import 'package:ayooshshein/Fetures/scanText/camera/presentation/textDetector.dart';
import 'package:flutter/material.dart';

import '../SignUpM/SignUpM.dart';
import '../stat/presentation/statics.dart';

class adminPageM extends StatelessWidget {
  const adminPageM({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StandardButton((){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>recordM(condition: 'status', conditionValue: 0,)));
            }, "الطلبات الحاليه"),
            SizedBox(height: 20,),
            StandardButton(
                    (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>recordM(condition: 'status', conditionValue: 1,)));},
                "الطلبات قيد العمل"),
            SizedBox(height: 20,),
            StandardButton((){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>recordM(condition: 'status', conditionValue: 2,)));
            }, "الطلبات التي تم انهائها"),
            SizedBox(height: 20,),
            StandardButton((){Navigator.push(context, MaterialPageRoute(builder: (context)=>scanText()));}, "المسح الضوئي"),
            SizedBox(height: 20,),
            StandardButton((){Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpM()));}, "انشاء حساب لمستخدم جديد"),
            SizedBox(height: 20,),
            StandardButton((){Navigator.push(context, MaterialPageRoute(builder: (context)=>statics()));}, "احصائيات"),
          ],
        ),
      ),
    );
  }
}
