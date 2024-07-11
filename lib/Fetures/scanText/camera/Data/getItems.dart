import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../services/store_data.dart';

class getItems{
  List<QueryDocumentSnapshot> docs=[];
  String errorMessage="";
  Future readData()async{
    try{
      docs=(await Data().GetData('status', 1, '', '', 'items')).docs;
    }catch(e){
      errorMessage=e.toString();
    }
  }
}