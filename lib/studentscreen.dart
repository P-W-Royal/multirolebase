import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginscreen.dart';

class Studentscreen extends StatefulWidget {
  const Studentscreen({Key? key}) : super(key: key);

  @override
  State<Studentscreen> createState() => _StudentscreenState();
}


class _StudentscreenState extends State<Studentscreen> {
  String email = '', password = '', education ='',type='';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }
  loaddata()async{
    SharedPreferences sp= await SharedPreferences.getInstance();
    email = sp.getString('email') ?? '';
    password = sp.getString('password')??'';
    education =sp.getString('education')??'';
    type = sp.getString('usertype')??'';
    setState(() {

    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          title: Text('Student Screen' ),
          automaticallyImplyLeading: false,
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Login Data',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Email'),
                  Text(email.toString()),
                ],),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Password'),
                  Text(password.toString()),
                ],),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Education'),
                  Text(education.toString()),
                ],),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('User Type'),
                  Text(type.toString()),
                ],),
              SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.clear();

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                  setState(() {});
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: Colors.grey),
                  width: double.infinity,
                  child: Center(child: Text('Logout')),
                ),
              )
            ],
          ),
        ));
  }
}
