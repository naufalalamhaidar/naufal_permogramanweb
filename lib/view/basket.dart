import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/recipeController.dart';
import 'package:flutter_application_1/model/recipe.dart';
import 'package:flutter_application_1/view/detail_recipe.dart';

class BasketScreen extends StatefulWidget {
  final RecipeController recipeController;
  const BasketScreen({super.key, required this.recipeController});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  List<Recipe> recipes = [];

  @override
  void initState() {
    super.initState();
    recipes = widget.recipeController.getAllrecipes();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Basket"),
      ),
      body: recipes.isEmpty
          ? Center(child: Text("No recipes found"))
          : ListView(
              shrinkWrap: true,
              children: widgetRecipe(recipes),
            ),
    );
  }

  List<Widget> widgetRecipe(List<Recipe> recipes) {
    List<Widget> list = [];
    for (var recipe in recipes) {
      list.add(
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 100, 99, 97),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    recipe.name, 
                    style: TextStyle(fontSize: 24, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailRecipe(recipe: recipe),
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 300,
                    child: Image.network(
                      recipe.urlPhoto,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: const Color.fromARGB(255, 224, 224, 224),
                          child: Icon(Icons.image_not_supported),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: ReadMoreText(
                    recipe.description ?? "Tidak ada deskripsi",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        )
      );
    }
    return list;
  }
}

class ReadMoreText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;

  const ReadMoreText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
  });

  @override
  State<ReadMoreText> createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final text = widget.text;
    final maxLength = 100;
    final isLong = text.length > maxLength;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isExpanded ? text : (isLong ? text.substring(0, maxLength) + '...' : text),
          style: widget.style,
          textAlign: widget.textAlign,
        ),
        if (isLong)
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(
              isExpanded ? 'Read Less' : 'Read More',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}