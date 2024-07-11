import 'package:ayooshshein/Fetures/itemPage/itemPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../services/store_data.dart';

class ResultScreen extends StatelessWidget {
  final List documents;

  const ResultScreen({super.key, required this.documents});

  @override
  Widget build(BuildContext context) {
    return documents.isEmpty
        ? itemPage(
            doc: documents[0],
          )
        : Scaffold(
            appBar: AppBar(
              title: const Text('Result'),
            ),
            body: Column(children: [
              SizedBox(
                height: 10,
              ),
              Text(
                "المنتجات التي تم اضفتها",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(4),
                        height: 100,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade200,
                                  spreadRadius: 0.5,
                                  blurRadius: 10)
                            ],
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        itemPage(doc: documents[index])));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    documents[index]["productName"],
                                    style: TextStyle(
                                        fontSize: 17, fontFamily: "arabicBold"),
                                    textAlign: TextAlign.end,
                                  ),
                                  documents[index]["status"] == 0
                                      ? TextButton(
                                          onPressed: () {
                                            Data().deleteItem(
                                                documents[index], "items");
                                          },
                                          child: Text("حذف"))
                                      : documents[index]["status"] == 1
                                          ? Text('قيد العمل')
                                          : Text('تم الانجاز')
                                ],
                              ),
                              Text((index + 1).toString() + ' المنتج رقم '),
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ]));
  }
}
