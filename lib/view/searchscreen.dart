import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search),
              hintText: 'Cari...',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: Center(
              child: Text(
                'Search Screen',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey[700]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}