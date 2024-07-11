import 'package:ayooshshein/Fetures/itemPage/itemPage.dart';
import 'package:ayooshshein/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/store_data.dart';

class recordM extends StatelessWidget {
  const recordM({super.key, required this.condition, required this.conditionValue});
  final String condition;
  final  conditionValue;
  @override
  Widget build(BuildContext context) {
    print(Provider.of<AuthServices>(context).userData.id);
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(5),
          child: FutureBuilder(future: Data().GetData(condition,conditionValue, '', '', 'items'),builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.done){
              print(snapshot.data.docs.length);
              return Column(
                children: [
                  SizedBox(height: 10,),
                  Text("المنتجات التي تم اضفتها",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                  SizedBox(height: 30,),
                  Expanded(
                    child: ListView.builder(
                        itemCount: snapshot.data.docs.length,
                        itemBuilder: (context,index){
                          return Container(
                            margin: EdgeInsets.all(4),
                            height: 100,
                            decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey.shade200,spreadRadius: 0.5,blurRadius: 10)],borderRadius: BorderRadius.circular(50),color: Colors.white),
                            child: TextButton(
                              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>itemPage(doc:snapshot.data.docs[index])));},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(snapshot.data.docs[index]["productName"],style: TextStyle(fontSize: 17,fontFamily: "arabicBold"),textAlign: TextAlign.end,),
                                      snapshot.data.docs[index]["status"]==0?TextButton(onPressed: (){
                                        Data().deleteItem(snapshot.data.docs[index],"items");
                                      }, child: Text("حذف")):snapshot.data.docs[index]["status"]==1?Text('قيد العمل'):Text('تم الانجاز')
                                    ],
                                  ),
                                  Text((index+1).toString()+' المنتج رقم '),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ]
              );
            }
            else if(snapshot.hasError){
              return Container(
                child: Text("هنالك خطا تاكد من الانترنت"),
              );
            }
            else{
              return Center(child: CircularProgressIndicator(),);
            }
          },),
        ),
      ),
    );
  }
}
