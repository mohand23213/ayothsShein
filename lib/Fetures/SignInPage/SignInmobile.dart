import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../services/authentication.dart';
import '../NavBar/NavBar.dart';

class SignInMobile extends StatefulWidget {
  const SignInMobile({super.key});

  @override
  State<SignInMobile> createState() => _SignInDesktopState();
}

class _SignInDesktopState extends State<SignInMobile> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.sizeOf(context);
    return SafeArea(

      child: Scaffold(
        backgroundColor: Color(0xff5b1647),
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                height: size.height,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0xffff5627),),
                    width: 300,
                    height: size.height*0.5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 50,),
                        Text('تسجيل الدخول',style: TextStyle(color: Colors.white,fontSize: 35),),
                        SizedBox(height: size.height*0.1,),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white,),
                          width: 225,
                          child: Row(
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.email),
                              Container(child: TextField(decoration: InputDecoration(border: InputBorder.none,hintText: "البريد الاكتروني"),textAlign: TextAlign.center,controller: emailController,),width: 180,)
                            ],
                          ),),
                        SizedBox(height: 30,),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white,),
                          width: 225,
                          child: Row(
                            children: [
                              SizedBox(width: 20,),
                              Icon(Icons.password),
                              Container(child: TextField(decoration: InputDecoration(border: InputBorder.none,hintText: "كلمة السر"),controller: passwordController,textAlign: TextAlign.center,obscureText: true,),width: 180,)
                            ],
                          ),),
                        SizedBox(height: 30,),
                        Container(
                          width: 250,
                          height: 50,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: const Color(0xffffc400)),
                          child: TextButton(child: Text("تسجيل الدخول",style: TextStyle(color: Colors.white,fontSize: 20),),onPressed: ()async{
                            await Provider.of<AuthServices>(context,listen: false).login(emailController.text, passwordController.text);
                            if(Provider.of<AuthServices>(context,listen: false).errorMessage.isEmpty){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>NavBar()));
                            }else{
                              setState(() {});
                            }
                          },),
                        ),
                        Text(Provider.of<AuthServices>(context,listen: false).errorMessage,style: TextStyle(color: Colors.white),)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 50,
              child: Center(child: Text("Ballot Shop",style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),)),
              width: size.width,
            )
          ],
        ),
      ),
    );
  }
}
