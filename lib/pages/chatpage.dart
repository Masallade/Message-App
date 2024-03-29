import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:welcomeback/auth_services/auth_service.dart';
import 'package:welcomeback/components/chat_bubble.dart';
import 'package:welcomeback/components/textformfield.dart';
import 'package:welcomeback/firestore_for_chats/chat_service.dart';

class ChatPage extends StatefulWidget {
  final String receivedEmail;
  final String receiverID;
   ChatPage({
    super.key,
    required this.receivedEmail,
     required this.receiverID,
  });

  final TextEditingController _messageController =TextEditingController();
  final Chat_Service _chatService =Chat_Service();
  final AuthService _authService=AuthService();


  void sendMessage()async{
    if(_messageController.text.isNotEmpty){
      await _chatService.sendMessage(receiverID, _messageController.text);
      _messageController.clear();
    }
  }


  @override


  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  FocusNode myFocusNode=FocusNode();

  void initState(){
    super.initState();
    myFocusNode.addListener(() {
      if(myFocusNode.hasFocus){

        Future.delayed(const Duration(milliseconds: 500),
            ()=>scrollDown()

        );

      }

    });

  }
  @override
  void dispose(){
    myFocusNode.dispose();
    widget._messageController.dispose();
    super.dispose();
  }

  final ScrollController scrollController=ScrollController();
  void scrollDown(){
    scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn);

  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(widget.receivedEmail),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey.shade500,
        elevation: 10,
      ),
      body: Column(
        children: [
          Expanded(
              child: _buildMessageList(),
          ),
          _buildUserInput()
        ],
      ),
    );
  }

  Widget _buildMessageList(){
    String senderID=widget._authService.getCurrentUser()!.uid;
    return StreamBuilder(
        stream: widget._chatService.getMessages(widget.receiverID, senderID),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return const Text('Error');
          }

          if(snapshot.connectionState==ConnectionState.waiting){
            return const Text('Loadighjghgng');
          }

          return ListView(
            children:
            snapshot.data!.docs.map((doc)=>_buildMessageItem(doc)).toList(),
            controller: scrollController,
          );
        }
    );
  }

  Widget _buildMessageItem(DocumentSnapshot doc){
     Map<String,dynamic>data=doc.data() as Map<String,dynamic>;
     bool isCurrentUser = data['senderID']==widget._authService.getCurrentUser()!.uid;
     var alignment= isCurrentUser ? Alignment.centerRight :Alignment.centerLeft;

    return Container(
        alignment: alignment,
        child: Column(
          crossAxisAlignment:
          isCurrentUser ? CrossAxisAlignment.end :CrossAxisAlignment.start,
          children: [
            ChatBubble(
                message: data["message"],
                isCurrentUser: isCurrentUser),
          ],
        ));
  }

  Widget _buildUserInput(){
    return Padding(
      padding: const EdgeInsets.only(bottom: 50.0),
      child: Row(
        children: [
          Expanded(
              child:U_Textformfield(
                controller: widget._messageController,
                hinttext: 'Type a Message',
                obscureText: false,
                focusNode: myFocusNode,
              )
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.only(right:15),
            child: IconButton(
                onPressed: widget.sendMessage,
                icon:const Icon(Icons.arrow_upward),
              color: Colors.white,
            ),
          )

        ],
      ),
    );
  }

}
