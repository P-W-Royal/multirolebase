import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multirolebase/homescreen.dart';
import 'package:multirolebase/loginscreen.dart';
import 'package:multirolebase/studentscreen.dart';
import 'package:multirolebase/teacherscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);
  @override



  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState(){
    super.initState();
isLogin();

  }

  void isLogin()async{
    SharedPreferences sp= await SharedPreferences.getInstance();
    bool isLogin = sp.getBool('isLogin') ?? false;

    String userType= sp.getString('userType')??'';




    if(isLogin) {
      if (userType == 'student') {
        Timer(Duration(seconds: 3), () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => Studentscreen(),));
        });
      }


      else if (userType == 'teacher') {
        Timer(Duration(seconds: 3), () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => Teacherscreen(),));
        });
      }
      else {

    Timer(Duration(seconds: 3),(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homescreen() ,));
    });
    }
    }
    else{
      Timer(Duration(seconds: 3),(){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen() ,));
      });
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.purple,


        body:Center(

          child: Container(
            decoration: BoxDecoration(
                color: Colors.purple
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(image: NetworkImage('https://images.unsplash.com/photo-1617040619263-41c5a9ca7521?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),),
                Text('Apple',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
              ],
            ),
          ),
        )


    );
  }
}












