import 'dart:math';

import 'package:ayooshshein/Fetures/adminPage/adminPage.dart';
import 'package:ayooshshein/Fetures/commonWiget.dart';
import 'package:ayooshshein/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class profileD extends StatelessWidget {
  const profileD({super.key});

  @override
  Widget build(BuildContext context) {
    final userData=Provider.of<AuthServices>(context).userData;
    Size size=MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body:Column(
          children: [
            SizedBox(height: 30,),
            Container(child: ClipRRect(child: Image.asset("lib/images/background.jpg",fit: BoxFit.fill,),borderRadius: BorderRadius.circular(30),),width: 900,decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.red,),),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(userData["name"],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                    Text(userData["email"],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                  ],
                ),
                Icon(Icons.account_circle,size: 100,color: Colors.blueAccent,),
                SizedBox(width: max((size.width-920)/2, 0),)
              ],
            ),
            userData["isadmin"]?StandardButton((){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>adminPage()));
            },("صفحة الادمن")):Container()
          ],
        ),
      ),
    );
  }
}
