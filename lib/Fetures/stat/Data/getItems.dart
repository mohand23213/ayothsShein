
import 'package:ayooshshein/services/store_data.dart';

class getItems{
  Future get()async{
    var x=await Data().GetData('', '', '', '', 'items');
    List y=x.docs;
    print(y);
    return y;
  }
}