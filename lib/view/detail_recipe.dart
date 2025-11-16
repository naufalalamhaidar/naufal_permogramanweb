import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/recipe.dart';

class DetailRecipe extends StatelessWidget {
  final Recipe recipe;
  
  const DetailRecipe({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipe Details"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Gambar
            Container(
              height: 300,
              color: Colors.grey.shade300,
              child: Image.network(
                recipe.urlPhoto,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Icon(Icons.image_not_supported, size: 50),
                  );
                },
              ),
            ),
            
            // Judul di tengah
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                recipe.name,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            
            // Deskripsi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                recipe.description ?? "Tidak ada deskripsi",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  height: 1.5,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            
            // Tombol Back
            Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Back to MyBasket"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}