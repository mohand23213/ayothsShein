import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class AuthServices extends ChangeNotifier{
  FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseMessaging messaging=FirebaseMessaging.instance;
  String errorMessage='';
  bool waiting=false;
  User? user;
  var userData;
  AuthServices(){
    user=_auth.currentUser;
  }

  void toggle(){
    waiting=!waiting;
    notifyListeners();
  }
  Future login(String email,String password)async{
    toggle();
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) =>  user=_auth.currentUser);
    }on FirebaseAuthException catch(e){
      errorMessage=e.message.toString();
      print(errorMessage);
      notifyListeners();
      Future.delayed(Duration(seconds: 1)).then((value) =>errorMessage='');
    }
    toggle();
  }
  Future signUp(String name,String email,String password)async{
    toggle();
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password,);
      storeUser(name,email,false);
    }
    on FirebaseAuthException catch(e){
      errorMessage=e.message.toString();
      notifyListeners();
      Future.delayed(Duration(seconds: 1)).then((value) =>errorMessage='');
    }
    toggle();
  }
  Future signOut()async{
    toggle();
    await _auth.signOut();
    user=null;
    toggle();
  }
  User returnUser(){
    return user!;
  }
  Future storeUser(String name,String email,bool isadmin)async{
    FirebaseFirestore store=FirebaseFirestore.instance;
    await store.collection('Users').add({'name':name,'email':email,"isadmin":isadmin});
  }
  Future readUserData()async{
    FirebaseFirestore store=FirebaseFirestore.instance;
    var jasonArray=await store.collection('Users').where('email',isEqualTo: user!.email).get();
    userData=jasonArray.docs[0];
  }
}