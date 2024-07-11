import 'package:flutter/material.dart';

import '../models/findStatcis.dart';

class statics extends StatefulWidget {
  const statics({super.key});

  @override
  State<statics> createState() => _staticsState();
}

class _staticsState extends State<statics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder(future: statica().getStatics(), builder: (context,map)=>column(
            map.data as Map<String,dynamic>
          ))
        ],
      ),
    );
  }
  Column column(Map<String,dynamic> map){
    print(map);
    return Column(
      children: [
        for(int i=0;i<map.keys.length;i++)
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(map.keys.elementAt(i).toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              Text(map[map.keys.elementAt(i)].toString()),
            ],
          )
      ],
    );
  }
}
