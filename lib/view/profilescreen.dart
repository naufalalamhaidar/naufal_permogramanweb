import 'package:flutter/material.dart';
import 'StudentDetail.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=10"),
          ),
          const SizedBox(height: 12),
          const Text('Nama Pengguna', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              // contoh navigasi ke StudentDetail
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const StudentDetail(id: 10)),
              );
            },
            child: const Text('Lihat detail'),
          ),
        ],
      ),
    );
  }
}