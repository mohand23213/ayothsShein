import 'dart:math';

import 'package:ayooshshein/services/authentication.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/store_data.dart';

class addItemM extends StatefulWidget {
  const addItemM({super.key});

  @override
  State<addItemM> createState() => _addItemState();
}

class _addItemState extends State<addItemM> {
  final selectedItem=[true,false];
  Map<String,dynamic> data={"status":0};
  GlobalKey<FormState> key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    data["Clientname"]=Provider.of<AuthServices>(context).userData["name"]!;
    data["ClientDocId"]=Provider.of<AuthServices>(context).userData.id as String;
    return SafeArea(
      child: Form(
        key: key,
        child: Scaffold(
            body: Container(
              width: MediaQuery.sizeOf(context).width,
              child: SingleChildScrollView(
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
                    SizedBox(height: 70,),
                    selectedItem[0]?toCustomer(data):toClient(data),
                    Container(child: TextButton(
                        onPressed: (){
                          if(key.currentState!.validate()){
                            data['productLink']=(data["productLink"].substring(max(data["productLink"].indexOf("http") as int, 0)));
                            Data().storeItemOrGategory(data, 'items');
                          }
                    },
                    child: Text("اضف",style: TextStyle(color: Colors.white,fontSize: 17),)),decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.blue),width: 200,)
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
  Widget toCustomer(Map data){
    return Column(
      children: [
        textfeild("CustomerName","اسم الزبون",data,MediaQuery.sizeOf(context)),
        SizedBox(height: 30,),
        textfeild("CustomerPhoneNumber","رقم الهاتف",data,MediaQuery.sizeOf(context)),
        SizedBox(height: 30,),
        textfeild("CustomerAddress","العنوان",data,MediaQuery.sizeOf(context)),
        SizedBox(height: 30,),
        textfeild("productName","اسم المنتج",data,MediaQuery.sizeOf(context)),
        SizedBox(height: 30,),
        textfeild("productCount","عدد",data,MediaQuery.sizeOf(context)),
        SizedBox(height: 30,),
        textfeild("productLink","رابط المنتج",data,MediaQuery.sizeOf(context)),
        SizedBox(height: 30,),
        textfeild("productSize","المقاس",data,MediaQuery.sizeOf(context)),
        SizedBox(height: 30,),
        textfeild("productSKU","SKU",data,MediaQuery.sizeOf(context)),
        SizedBox(height: 30,),
      ],
    );
  }
  Widget toClient(Map data){
    return Column(
      children: [
        textfeild("ClientName","اسم العميل",data,MediaQuery.sizeOf(context)),
        SizedBox(height: 30,),
        textfeild("productName","اسم المنتج",data,MediaQuery.sizeOf(context)),
        SizedBox(height: 30,),
        textfeild("productCount","عدد",data,MediaQuery.sizeOf(context)),
        SizedBox(height: 30,),
        textfeild("productLink","رابط المنتج",data,MediaQuery.sizeOf(context)),
        SizedBox(height: 30,),
        textfeild("productSize","المقاس",data,MediaQuery.sizeOf(context)),
        SizedBox(height: 30,),
        textfeild("productSKU","SKU",data,MediaQuery.sizeOf(context)),
        SizedBox(height: 30,),

      ],
    );
  }
}
Row textfeild(String nameAtDatabase,String name,Map map,size){
  TextEditingController controller=TextEditingController();
  return Row(
    mainAxisAlignment:MainAxisAlignment.spaceEvenly,
    children: [
      SizedBox(
        width: size.width*0.5,
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
      Container(width: size.width/4,child: Text(name),alignment: Alignment.topRight,)
    ],
  );
}
String? validInput(String? validEmail) {
  if (validEmail == null || validEmail.length == 0)
    return 'يرحى اضافة المطلوب';
}
OutlineInputBorder inputBorder= OutlineInputBorder(borderSide: BorderSide(color: Colors.blue), borderRadius: BorderRadius.circular(10));