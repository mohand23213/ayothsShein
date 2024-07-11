import 'package:flutter/material.dart';

import '../../stat/Data/getItems.dart';

class statica{
  getItems items=getItems();
  Map<String,dynamic> data={};
  Future<Map<String,dynamic>> getStatics()async{
    List x=await items.get();
    print(x);
    print(1);
    x.forEach((element) {
      if(data[element["ClientName"]]==null){
        data[element["ClientName"]]=0;
      }
      print(element["price"]);
      data[element["ClientName"]]+=double.parse(element["price"]);
    });
    print(data);
    return data;

  }

}