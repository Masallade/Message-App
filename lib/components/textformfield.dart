import'package:flutter/material.dart';

class U_Textformfield extends StatelessWidget{
  final String hinttext;
  final bool obscureText;
  final TextEditingController controller;
  final FocusNode ? focusNode;
  const U_Textformfield({
    super.key,
    required this.hinttext,
    required this.obscureText,
    required this.controller,
    this.focusNode,

  });
  @ override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        focusNode: focusNode,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          enabledBorder:OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder:OutlineInputBorder(
            borderSide:BorderSide(color: Colors.blueGrey,),
            borderRadius: BorderRadius.circular(25),
          ),
          hintText: hinttext,

          hintStyle: TextStyle(color: Colors.grey.shade500),



          suffixIcon: IconButton(
              onPressed:(){
                controller.clear();

              },
              icon:Icon(Icons.close,)),


        ),
      ),
    );
  }

}
