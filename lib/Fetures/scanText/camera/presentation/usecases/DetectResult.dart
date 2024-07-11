import 'package:ayooshshein/Fetures/scanText/camera/Data/getItems.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_mlkit_text_recognition/google_mlkit_text_recognition.dart';

class detectResult{
  getItems items=getItems();
  List<QueryDocumentSnapshot> listOfItems=[];
  Future findResult({required RecognizedText recognizer})async{
    if(items.docs.isEmpty && items.errorMessage.isEmpty){
      await items.readData();
    }
    else if(items.errorMessage.isNotEmpty){
      return items.errorMessage;
    }
    print(recognizer.text);
    items.docs.forEach((element) {
      if(recognizer.text.toLowerCase().contains(element["productSKU"].substring(2).toLowerCase())){
        listOfItems.add(element);
      }
    });
    return listOfItems;
  }
}
