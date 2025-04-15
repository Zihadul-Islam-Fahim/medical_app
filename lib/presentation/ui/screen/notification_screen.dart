import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: Center(
        child: Text("No Notifications",style: TextStyle(fontSize: 14,fontFamily: 'mn'),        ),
      ),
    );
  }
}
