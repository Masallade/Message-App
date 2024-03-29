import 'package:welcomeback/auth_services/auth_service.dart';
import 'package:welcomeback/interaction/login_interaction_register.dart';
import 'package:welcomeback/components/button.dart';
import 'package:welcomeback/components/textformfield.dart';
import 'package:flutter/material.dart';





class MyApp extends StatefulWidget {
  final void Function()? onTap;
  MyApp({super.key,required this.onTap});


  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController em_controller=TextEditingController();
  final TextEditingController pw_controller=TextEditingController();
  @ override

  void login(BuildContext context) async {
    final authService=AuthService();
    try{
      await authService.signInWithEmailPassword(
          em_controller.text,
          pw_controller.text,
      );
    }
    catch(e){
      showDialog(
          context: context,
          builder: (context)=>AlertDialog(
            title:Text(e.toString())
          ));
    }

  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              SizedBox(height: 20,),
              Icon(Icons.message_outlined),
              SizedBox(height: 20,),
              RichText(
                  text:TextSpan(
                      text: '',
                      style: Theme.of(context).textTheme.labelMedium,
                      children: const [
                        TextSpan(

                            text:'Welcome',
                            style: TextStyle(fontSize: 20,color: Colors.white)

                        ),
                        TextSpan(
                            text:'Back',
                            style: TextStyle(fontSize: 40,color: Colors.white)

                        ),
                      ]
                  )
              ),

              SizedBox(height: 20,),
              U_Textformfield(
                obscureText: false,
                hinttext: 'Email',
                controller: em_controller,
              ),
              SizedBox(height: 20,),
              U_Textformfield(
                obscureText: true,
                hinttext: 'password',
                controller: pw_controller,
              ),
              SizedBox(height: 40,),
              myButton(
                name:'Login',
                onTap: ()=>login(context),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Ooh not have a Acccount ',style: TextStyle(color: Colors.grey.shade500)),
                  GestureDetector(
                      onTap: widget.onTap,
                      child: Text('Register Now',style: TextStyle(fontStyle: FontStyle.italic,decoration: TextDecoration.underline,color: Colors.white),)),
                ],
              )








            ]
        ),
      ),

    );
  }
}
