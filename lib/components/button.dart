import 'package:flutter/material.dart';

class myButton extends StatefulWidget{
  final String name;
  final void Function()? onTap;
  const myButton({
    super.key,
    required this.name,
    required this.onTap,

  });

  @override
  State<myButton> createState()=> _myButtonState();
}
class _myButtonState extends State<myButton>{

  Widget build(BuildContext context){
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(25),
          ),

          child: Padding(
              padding: EdgeInsets.all(25),
              child: Center(child: Text(widget.name,style: TextStyle(color: Colors.white),))),


        ),
      ),
    );
  }
}