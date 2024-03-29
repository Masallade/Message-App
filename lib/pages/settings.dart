import 'package:flutter/material.dart';
class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey.shade500,
        elevation: 10,
        centerTitle: true,
        title: const Text('Setting',),
      ),
      backgroundColor: Colors.black,
    );
  }
}
