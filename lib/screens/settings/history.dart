import 'package:flutter/material.dart';
import 'package:mykitchenapp/modals/recipe_model.dart';
import 'package:mykitchenapp/widgets/appbar.dart';
import 'package:mykitchenapp/widgets/itemgrid.dart';

class History extends StatelessWidget {
  const History({super.key, required this.listOfRecipes});

  final List<RecipeModel> listOfRecipes;
  @override
  Widget build(BuildContext context) {
    int size = listOfRecipes.length;
    return Scaffold(
      appBar: CustomAppbar("Your Recipes"),
      body: size != 0
          ? Itemgrid(selectedRecipes: listOfRecipes)
          : Center(
              child: Text(
                "No Recipe Selected",
                style: TextStyle(color: Color.fromRGBO(86, 106, 79, 1)),
              ),
            ),
    );
  }
}
