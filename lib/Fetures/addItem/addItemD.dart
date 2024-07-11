import 'dart:math';

import 'package:ayooshshein/Fetures/commonWiget.dart';
import 'package:ayooshshein/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/store_data.dart';

class addItemD extends StatefulWidget {
  const addItemD({super.key});

  @override
  State<addItemD> createState() => _addItemState();
}

class _addItemState extends State<addItemD> {
  final selectedItem=[true,false];
  late Map<String,dynamic> data={};
  GlobalKey<FormState> key=GlobalKey<FormState>();
  @override
  void initState() {
    data={"status":Provider.of<AuthServices>(context,listen: false).userData["isadmin"]?1:0};
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    data["Clientname"]=Provider.of<AuthServices>(context).userData["name"]!;
    data["ClientDocId"]=Provider.of<AuthServices>(context).userData.id as String;
    return Form(
      key: key,
      child: Scaffold(
          body: Center(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [Color(0xff0264b2),Color(0xff03a9f4)],begin: Alignment.bottomLeft,end: Alignment.topRight),
                  borderRadius: BorderRadius.circular(30),
                boxShadow: [BoxShadow(color: Colors.black,blurRadius: 10,spreadRadius: 0.5)]
              ),
              padding: EdgeInsets.all(20),
              width: 600,
              height: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30,),
                  ToggleButtons(
                    isSelected: selectedItem,
                    fillColor: Color(0Xff1e8ffa),
                    selectedColor: Colors.white,
                    onPressed: (index){selectedItem[index]=true;selectedItem[1-index]=false;setState(() {});},
                    children: [
                      Container(child: Text('توصيل مباشر'),padding: EdgeInsets.all(10)),
                      Container(child: Text('توصيل للعميل'),padding: EdgeInsets.all(10),)],
            
                  ),
                  SizedBox(height: 30,),
                  selectedItem[0]?toCustomer(data):toClient(data),
                  SizedBox(height: 50,),
                  StandardButton((){
                        if(key.currentState!.validate()){
                          data['productLink']=(data["productLink"].substring(max(data["productLink"].indexOf("http") as int, 0)));
                          Data().storeItemOrGategory(data, 'items');
                        }
                      },
                      ("اضف"))
                ],
              ),
            ),
          )
      ),
    );
  }
  Widget toCustomer(Map data){
    return Column(
      children: [
        row(children: [
            textfeild("CustomerName","اسم الزبون",data,MediaQuery.sizeOf(context)),
            SizedBox(height: 30,),
            textfeild("CustomerPhoneNumber","رقم الهاتف",data,MediaQuery.sizeOf(context)),
          ],),
        row(children: [
            textfeild("CustomerAddress","العنوان",data,MediaQuery.sizeOf(context)),
            SizedBox(height: 30,),
            textfeild("productName","اسم المنتج",data,MediaQuery.sizeOf(context)),
          ],),
        row(children: [
            textfeild("productCount","عدد",data,MediaQuery.sizeOf(context)),
            SizedBox(width: 30,),
            textfeild("productLink","رابط المنتج",data,MediaQuery.sizeOf(context)),
          ],),
        row(
          children: [
            textfeild("productSize","المقاس",data,MediaQuery.sizeOf(context)),
            SizedBox(width: 30,),
            textfeild("productLink","رابط المنتج",data,MediaQuery.sizeOf(context)),
          ],
        ),
      ],
    );
  }
  Widget toClient(Map data){
    return Column(
      children: [
        row(children: [
            textfeild("productName","اسم المنتج",data,MediaQuery.sizeOf(context)),
            SizedBox(height: 30,),
            textfeild("productCount","عدد",data,MediaQuery.sizeOf(context)),
          ]),
        row(children: [
            textfeild("productLink","رابط المنتج",data,MediaQuery.sizeOf(context)),
            SizedBox(height: 30,),
            textfeild("productSize","المقاس",data,MediaQuery.sizeOf(context)),
          ],),
        row(children: [
          textfeild("productSKU","SKU",data,MediaQuery.sizeOf(context)),
          SizedBox(height: 30,),
          textfeild("ClientName","اسم العميل",data,MediaQuery.sizeOf(context)),
        ],),
        textfeild("price","السعر",data,MediaQuery.sizeOf(context)),

      ],
    );
  }
}
Row textfeild(String nameAtDatabase,String name,Map map,size){
  TextEditingController controller=TextEditingController();
  return Row(
    children: [
      SizedBox(
        width: 200,
        child:TextFormField(
          validator: validInput,
          controller: controller,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            border: inputBorder,
            fillColor: Colors.white,
            hoverColor: Colors.white,
            filled: true,
          ),
          onChanged: (value){
            map[nameAtDatabase]=value;
          },
        ),
      ),
      SizedBox(width: 10,),
      Container(child: Text(name,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),alignment: Alignment.topRight,width: 50,)
    ],
  );
}
String? validInput(String? validEmail) {
  if (validEmail == null || validEmail.length == 0)
    return 'يرحى اضافة المطلوب';
}
OutlineInputBorder inputBorder= OutlineInputBorder(borderSide: BorderSide(color: Colors.blue), borderRadius: BorderRadius.circular(10));
Row row({required children}){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: children,
  );
}

/*
void insertItem(){

  x["ClientName"]='ام سيليا';
  x["ClientDocId"]='rFkeUhMieh2Fn2ynh364';
  Data().storeItemOrGategory({"price":x['price'],}, 'items');
}
Map x={
  "name": "800 قطعة ربطة شعر سوداء من TPU معبأة في مرطبان",
  "price": 9.00,
  "size": "واحد",
  "sku": "sc2310176389635039"
};*/
