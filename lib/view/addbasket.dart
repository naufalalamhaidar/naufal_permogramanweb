import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/recipeController.dart';
import 'package:flutter_application_1/model/recipe.dart';

class AddBasket extends StatefulWidget {
  final RecipeController recipe;
  const AddBasket({super.key, required this.recipe});

  @override
  State<AddBasket> createState() => _AddBasketState();
  }

class _AddBasketState extends State<AddBasket> {
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController urlPhotoController = TextEditingController();

  String urlPhoto = "";

@override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Basket"),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(16.0),
        child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Recipe Name",
              ),
            ),
            SizedBox(height: 25.0),
            TextField(
              controller: urlPhotoController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Recipe URL Photo",
              ),
              onSubmitted: (value) {
                setState(() {
                  urlPhoto = urlPhotoController.text;
                });
              },
            ),
            SizedBox(height: 25.0),
            Image.network(
              urlPhoto,
              height: 300,
            ),
            SizedBox(height: 25.0),
            TextField(
              maxLines: 6,
              controller: descController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Recipe Description",
              ),
            ),
            SizedBox(height: 25.0),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.resolveWith(changeColor),
              ),
              onPressed: (){
                widget.recipe.addRecipe(Recipe(
                  id: 0, 
                  name: nameController.text, 
                  description: descController.text, 
                  urlPhoto: urlPhotoController.text,
                ));

                  Navigator.pop(context);
              },
              child: Text("Save Picture", style: TextStyle(color: Colors.white),),
            )
          ],
        )
        )
      ),
    );
  }

  Color changeColor (Set<WidgetState> states){
    if(states.contains(WidgetState.pressed)){
      return Colors.redAccent;
    } else {
      return Colors.brown;
    }
  }

}