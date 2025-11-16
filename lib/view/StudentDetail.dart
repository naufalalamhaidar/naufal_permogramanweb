import 'package:flutter/material.dart';

class StudentDetail extends StatelessWidget {
  final id;
  const StudentDetail({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student $id")),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(200),
          child: Image.network("https://i.pravatar.cc/150?img=$id"),
        ),
      ),
    );
  }
}
