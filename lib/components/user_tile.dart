import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function() ? onTap;
  const UserTile({
    super.key,
    required this.text,
    required this.onTap,

  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.symmetric(horizontal: 25,vertical: 15),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(Icons.person,color: Colors.white,),
            SizedBox(width: 20,),
            Text(text,style: TextStyle(color: Colors.white),),
          ],
        ),
      ),

    );
  }
}
