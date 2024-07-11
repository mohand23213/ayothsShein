import 'package:flutter/material.dart';

Container StandardButton(Function function,String text){
  return Container(
    width: 200,
    height: 50,
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.blue,),
    child: TextButton(onPressed:(){function();},child: Text(text,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),

  );
}