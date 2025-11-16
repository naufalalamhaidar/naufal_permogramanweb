import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homescreen"),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "Home",
          style: TextStyle(fontSize: 12),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}