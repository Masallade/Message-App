import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:welcomeback/auth_services/auth_service.dart';
import 'package:welcomeback/auth_services/auth_streambuilder.dart';
import 'package:welcomeback/firebase_options.dart';
import 'package:welcomeback/firestore_for_chats/chat_service.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:AuthGate(),
    );
  }
}
