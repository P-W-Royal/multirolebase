import 'package:flutter/material.dart';
import 'package:multirolebase/homescreen.dart';
import 'package:multirolebase/studentscreen.dart';
import 'package:multirolebase/teacherscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final educationcontroller = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Login')),
          backgroundColor: Colors.yellow,
        ),
        body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              TextFormField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  hintText: 'Email',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            SizedBox(height: 20,),
              TextFormField(
                obscureText: true,

                controller: passwordcontroller,
                decoration: InputDecoration(
                  hintText: 'Password'

                ),
                keyboardType: TextInputType.emailAddress,
              ),
            SizedBox(height: 20,),

            TextFormField(
              controller: educationcontroller,
                decoration: InputDecoration(
                  hintText: 'Education',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            SizedBox(height: 40,),

            InkWell(
              onTap: ()async{
                SharedPreferences sp= await SharedPreferences.getInstance();
                sp.setString('email', emailcontroller.text.toString());
                sp.setString('password', passwordcontroller.text.toString());
                sp.setString('education',educationcontroller .text.toString());
                sp.setString('usertype', 'teacher');

                sp.setBool('isLogin', true);


                if(sp.getString('usertype')== 'teacher'){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Teacherscreen(),));
                  setState(() {

                  });
                }else if(sp.getString('usertype')== 'student'){
    Navigator.push(context, MaterialPageRoute(builder: (context) => Studentscreen(),));
    setState(() {

    });

                }else
                  { Navigator.push(context, MaterialPageRoute(builder: (context) => Homescreen(),));
                  setState(() {

                  });

                }
                },
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey
                  ),
                  width: double.infinity,

                  child: Center(child: Text('Login')),
                ),
              )
          ],
        ),
            )),
      ),
    );
  }
}
