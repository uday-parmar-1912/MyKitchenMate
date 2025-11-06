
import 'package:flutter/material.dart';
import 'package:mykitchenapp/modals/recipe_model.dart';
import 'package:mykitchenapp/screens/itemdetail.dart';

class SearchedItem extends StatelessWidget {
  const SearchedItem({super.key, required this.searchResult});

  final RecipeModel searchResult;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemDetailPage(recipe: searchResult),
          ),
        );
      },
      child: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 150,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromRGBO(86, 106, 79, 1),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 30, right: 8, top: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          searchResult.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "Nutritions: Energy ${searchResult.nutrients["calories"]} Kcal, "
                          "Protein ${searchResult.nutrients["protein"]}, Sugar ${searchResult.nutrients["carbs"]}",
                          style: const TextStyle(fontSize: 10),
                        ),
                        Text(
                          "Cooking Time: ${searchResult.time}",
                          style: const TextStyle(fontSize: 10),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 8,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  searchResult.imagePath,
                  height: 140,
                  width: 170,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
