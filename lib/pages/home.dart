import 'package:flutter/material.dart';
import 'package:welcomeback/auth_services/auth_service.dart';
import 'package:welcomeback/components/home_drawer.dart';
import 'package:welcomeback/components/user_tile.dart';
import 'package:welcomeback/firestore_for_chats/chat_service.dart';
import 'package:welcomeback/pages/chatpage.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void logout(){
    final _auth=AuthService();
    _auth.signOut();
  }
  final AuthService authService=AuthService();
  final Chat_Service chat_service=Chat_Service();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey.shade500,
        elevation: 10,
        centerTitle: true,

        title: const Text('Home',),

      ),
      drawer:Home_Drawer(),
      body: _buildUserList(),



    );
  }
  Widget _buildUserList(){
    return StreamBuilder(
        stream: chat_service.getUserStream(),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return const Text('Error');
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            return const Text('Loading...');
          }
          return ListView(
            children: snapshot.data!.map<Widget>((userData)=>_buildUserListItem(userData,context)).toList(),

          );

        }
    );
  }

  Widget _buildUserListItem(Map<String, dynamic> userData,BuildContext context){
   if(userData["user"]!=authService.getCurrentUser()!.email){
     return UserTile(
       text: userData["email"],
       onTap: (){
         Navigator.push(context,MaterialPageRoute(builder:(context)=>ChatPage(
           receivedEmail: userData["email"],
           receiverID: userData["uid"],

         )));
       },

     );
   }
   else{
     return Container();
   }

  }




}

