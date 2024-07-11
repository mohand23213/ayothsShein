import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
class Data{
  final storage=FirebaseStorage.instance;
  FirebaseFirestore store=FirebaseFirestore.instance;
  Future storeItemOrGategory(Map<String,dynamic> map,String type)async{
    await store.collection(type).add(map);
  }
  Future storeImage(String path,int number) async{
    final result=await storage.ref().child('path').child('image${number}/${FirebaseAuth.instance.currentUser?.email}/${DateTime.now()}');
    await result.putFile(File(path),SettableMetadata(contentType: "image/jpeg"));
    var url=await result.getDownloadURL();
    return url;
  }
  Future updateFeild(String CollectionName,String feild,newValue,String whereFeild,String whereValue)async{
    await store.collection(CollectionName).where(whereFeild, isEqualTo: whereValue).get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        doc.reference.update({
          feild: newValue,
        });
      });
    });
  }
  Future updateCategory(jasonData,map)async{
    map["name"].isNotEmpty?store.collection('categories').doc(jasonData.id).update({"name":map["name"]}):null;
    for(int i=1;i<4;i++){
      if(map["image"+i.toString()]!=null && map["image"+i.toString()]!.isNotEmpty){
        await storage.refFromURL(jasonData["image"+i.toString()]).delete();
        var url=await storeImage(map["image"+i.toString()], i);
        store.collection('categories').doc(jasonData.id).update({"image"+i.toString():url});
      }
    }
  }
  Future deleteItem(jasonData,String Collection)async{
    await store.collection(Collection).doc(jasonData.id).delete();
  }
  Future updateFeildUsingId(String Collection,String id,String feild,newvalue)async{
    store.collection(Collection).doc(id).update({feild:newvalue});
  }
  Future deleteItemFromCart(data)async{
    store.collection("Cart").doc(data["id"]).delete();
  }
  Future GetData(String Condition,ConditionValue,String specificFeild,String sortCriteria,String collection)async{
    var Collection=store.collection(collection);
    var specificDocument=Condition.isNotEmpty?Collection.where(Condition,isEqualTo: ConditionValue):Collection;
    var get=await specificDocument.get();
    return get;
  }
  Future getDataUsingId(String colllection,String id)async{
    return await store.collection(colllection).doc(id).get();
  }
}