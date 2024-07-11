import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../services/authentication.dart';

class SignUpM extends StatefulWidget {
  const SignUpM({super.key});

  @override
  State<SignUpM> createState() => _SignInDesktopState();
}

class _SignInDesktopState extends State<SignUpM> {
  final nameController=TextEditingController();
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.sizeOf(context);
    return SafeArea(

      child: Scaffold(
        backgroundColor: Color(0xff5b1647),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: size.height,
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Color(0xffff5627),),
                    width: size.width*0.8,
                    height: size.height*0.6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 30,),
                        Text('انشاء حساب لعميل جديد',style: TextStyle(color: Colors.white,fontSize: 35),textAlign: TextAlign.center,),
                        SizedBox(height: 30,),
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.white,),
                          width: 225,
                          child: Row(
                            children: [
                              SizedBox(width: 10,),
                              Icon(Icons.person),
                              Container(child: TextField(decoration: InputDecoration(border: InputBorder.none,hintText: "اسم العميل"),textAlign: TextAlign.center,controller: nameController,),width: 180,)
                            ],
                          ),),
                        SizedBox(height: 30,),
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
                          child: TextButton(child: Text("انشاء حساب",style: TextStyle(color: Colors.white,fontSize: 20),),onPressed: ()async{
                            await Provider.of<AuthServices>(context,listen: false).signUp(nameController.text,emailController.text, passwordController.text);
                            if(Provider.of<AuthServices>(context,listen: false).errorMessage.isEmpty){
                              Navigator.pop(context);
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
              Positioned(
                top: 50,
                child: Center(child: Text("Ballot Shop",style: TextStyle(color: Colors.white,fontSize: 50,fontWeight: FontWeight.bold),)),
                width: size.width,
              )
            ],
          ),
        ),
      ),
    );
  }
}
