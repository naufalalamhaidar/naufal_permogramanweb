import 'package:flutter/material.dart';
import 'StudentDetail.dart';

class StudentList extends StatelessWidget {
  const StudentList({super.key});

  _openDetails(BuildContext context, int id) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => StudentDetail(id: id)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 70,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ElevatedButton(
              onPressed: () => _openDetails(context, index + 1),
              child: Text("Student #${index + 1}"),
            ),
            SizedBox(height: 10),
          ],
        );
      },
    );
  }
}
