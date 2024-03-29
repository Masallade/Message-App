import'package:flutter/material.dart';
import 'package:welcomeback/auth_services/auth_service.dart';
import 'package:welcomeback/components/button.dart';
import 'package:welcomeback/components/textformfield.dart';

class Register extends StatefulWidget {
  final void Function()? onTap;
  const Register({super.key,required this.onTap});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController em_controller=TextEditingController();
  final TextEditingController pw_controller=TextEditingController();
  final TextEditingController confromed_pw_controller=TextEditingController();

  void register(BuildContext context){
    final _auth=AuthService();
    if(pw_controller.text==confromed_pw_controller.text){
      try{
        _auth.signUpWithEmailPassword(
            em_controller.text,
            pw_controller.text);

      } catch(e){
        showDialog(
            context:context,
            builder: (context)=> AlertDialog(
              title: Text(e.toString()),

            ));
      }
    }
    else{
      showDialog(
          context: context,
          builder: (context)=> const AlertDialog(
        title: Text('Password not match'),

    ),);
    }


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              SizedBox(height: 20,),
              U_Textformfield(
                obscureText: true,
                hinttext: 'Conformed Password',
                controller: confromed_pw_controller,
              ),
              SizedBox(height: 40,),
              myButton(
                name:'Register',
                onTap: ()=> register(context),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('dude if you have an Acccount',style: TextStyle(color: Colors.grey.shade500),),
                  TextButton(
                      onPressed: widget.onTap,

                      child:Text('Login',style: TextStyle(fontStyle: FontStyle.italic,decoration: TextDecoration.underline,color: Colors.white),) )
                ],
              )








            ]
        ),
      ),

    );
  }
}
