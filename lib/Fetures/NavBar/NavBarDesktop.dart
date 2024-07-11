import 'package:flutter/material.dart';

import '../addItem/addItem.dart';
import '../profile/profile.dart';
import '../record/record.dart';

class NavBarD extends StatefulWidget {
  const NavBarD({super.key});

  @override
  State<NavBarD> createState() => _NavBarDState();
}

class _NavBarDState extends State<NavBarD> {
  List destinations=[profile(),addItem(),record()];
  int selectedIndex=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25,vertical: 25),
          child: Row(
            children: [
              Text('Ballot Shop',style: TextStyle(color: Colors.lightBlue,fontSize: 25,fontWeight: FontWeight.bold),),
              Spacer(),
              InkWell(child: Icon(Icons.account_circle,size: 40,color: Colors.lightBlue,),onTap: (){setState(() {selectedIndex=0;});},),
              SizedBox(width: 40,),
              InkWell(child: Icon(Icons.add,size: 40,color: Colors.lightBlue,),onTap: (){setState(() {selectedIndex=1;});},),
              SizedBox(width: 40,),
              InkWell(child: Icon(Icons.home_filled,size: 40,color: Colors.lightBlue,),onTap: (){setState(() {selectedIndex=2;});},),
            ],
          ),
        ),
      ),
      body: destinations[selectedIndex]
    );
  }
}
