import 'package:ayooshshein/Fetures/NavBar/NavBar.dart';
import 'package:ayooshshein/Fetures/SignInPage/SignInDesktop.dart';
import 'package:ayooshshein/Fetures/SignInPage/SignInmobile.dart';
import 'package:ayooshshein/services/authentication.dart';
import 'package:ayooshshein/services/store_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>AuthServices(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ballot Shop',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:myHomePage(),
      ),
    );
  }
}
class myHomePage extends StatefulWidget {
  const myHomePage({super.key});

  @override
  State<myHomePage> createState() => _myHomePageState();
}

class _myHomePageState extends State<myHomePage> {
  @override
  Widget build(BuildContext context) {
    return Provider.of<AuthServices>(context).user==null?ScreenTypeLayout(
        mobile:SignInMobile(),
        tablet: SignInDesktop(),
      desktop: SignInDesktop(),
    ):FutureBuilder(future: Provider.of<AuthServices>(context).readUserData(), builder: (context,snapshot){
      if(snapshot.connectionState==ConnectionState.done){
        return NavBar();
      }
      else if(snapshot.hasError){
        return Container(
          child: Text("هنالك خطا تاكد من الانترنت"),
        );
      }
      else{
        return Center(child: CircularProgressIndicator(),);
      }
    });
  }
}

/*
void deleteItems()async {
  var x = await Data().GetData('', '', '', '', 'items');
  List y= x.docs;
  y.forEach((element) {
    Data().deleteItem(element, 'items');
  });
}
*/
