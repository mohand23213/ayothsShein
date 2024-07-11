import 'package:ayooshshein/Fetures/adminPage/adminPage.dart';
import 'package:ayooshshein/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class profileM extends StatelessWidget {
  const profileM({super.key});

  @override
  Widget build(BuildContext context) {
    final userData=Provider.of<AuthServices>(context).userData;
    return SafeArea(
      child: Scaffold(
        body:Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
                child: ClipRRect(child: Image.asset("lib/images/background.jpg"),borderRadius: BorderRadius.circular(15),)
            ),
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
              ],
            ),
            userData["isadmin"]?TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>adminPage()));
            }, child: Text("صفحة الادمن")):Container()
          ],
        ),
      ),
    );
  }
}
