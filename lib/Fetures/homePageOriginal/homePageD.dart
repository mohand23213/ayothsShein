import 'package:flutter/material.dart';

class homePageD extends StatelessWidget {
  const homePageD({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              Text("جاهز للتسليم الفوري",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),)
            ],
          ),
        ),
      ),
    );
  }
}

