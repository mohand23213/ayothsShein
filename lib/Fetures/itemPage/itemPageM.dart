import 'package:ayooshshein/Fetures/commonWiget.dart';
import 'package:ayooshshein/services/authentication.dart';
import 'package:ayooshshein/services/store_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/productPageInShein.dart';

class itemPageM extends StatefulWidget {
  const itemPageM({super.key, this.doc});
  final doc;
  @override
  State<itemPageM> createState() => _itemPageMState();
}

class _itemPageMState extends State<itemPageM> {
  @override
  Widget build(BuildContext context) {
    print(widget.doc.data());
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30,),
              Text('معلومات منتج',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
              SizedBox(height: 5,),
              info('اسم العميل', widget.doc['ClientName']),
              SizedBox(height: 5,),
              info('اسم المنتج', widget.doc['productName']),
              SizedBox(height: 5,),
              info('SKU', widget.doc['productSKU']),
              SizedBox(height: 5,),
              info('القياس', widget.doc['productSize']),
              SizedBox(height: 5,),
              info('العدد', widget.doc['productCount']),
              SizedBox(height: 5,),
              info('السعر', widget.doc['price']),
              if(widget.doc.data().containsKey("CustomerName"))
                Column(
                  children: [
                    SizedBox(height: 5,),
                    info('اسم الزبون', widget.doc['CustomerName']),
                    SizedBox(height: 5,),
                    info('رقم هاتف الزبون', widget.doc['CustomerPhoneNumber']),
                    SizedBox(height: 5,),
                    info('عنوان الزبون', widget.doc['CustomerAddress']),
                  ],
                ),
              SizedBox(height: 5,),
              StandardButton((){SheinProduct.openProductPage(widget.doc['productLink']);}, "الدخول على صفحة المنتج"),
              SizedBox(height: 30,),
              if(widget.doc['status']==0 && Provider.of<AuthServices>(context).userData["isadmin"])
                StandardButton((){Data().updateFeildUsingId('items',widget.doc.id, 'status', 1);}, "بدء العمل"),
              if(widget.doc['status']==1 && Provider.of<AuthServices>(context).userData["isadmin"])
                StandardButton((){Data().updateFeildUsingId('items',widget.doc.id, 'status', 2);}, "تم التعبئه"),
            ],
          ),
        ),
      ),
    );
  }
}
Container info(String descriptionName,String value){
  return Container(
    padding: EdgeInsets.all(10),
    margin: EdgeInsets.only(top: 10),
    color: Colors.grey,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(value),
        Text(descriptionName),
      ],
    ),
  );
}