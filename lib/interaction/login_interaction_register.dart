
import 'package:flutter/material.dart';
import 'package:welcomeback/pages/register.dart';
import 'package:welcomeback/pages/main.dart';

class Login_Register extends StatefulWidget {
  const Login_Register({super.key});

  @override
  State<Login_Register> createState() => _Login_RegisterState();
}

class _Login_RegisterState extends State<Login_Register> {
  bool loginpage=true;
  void toggle(){
    if(loginpage){
      loginpage=!loginpage;

    }
    else{
      loginpage=!loginpage;

    }
    setState(() {


    });

  }





  @override
  Widget build(BuildContext context) {
    return loginpage!=true ? Register(onTap: toggle,):MyApp(onTap: toggle,);
  }
}
