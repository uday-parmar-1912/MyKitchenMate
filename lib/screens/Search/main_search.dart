import 'package:flutter/material.dart';
import 'package:mykitchenapp/dummy_data/sample_recipes.dart';
import 'package:mykitchenapp/modals/recipe_model.dart';
import 'package:mykitchenapp/screens/Search/whatiskitchen.dart';
import 'package:mykitchenapp/widgets/searched_item.dart';

class MainSearchPage extends StatefulWidget {
  const MainSearchPage({super.key});

  @override
  State<MainSearchPage> createState() => _MainSearchPageState();
}

class _MainSearchPageState extends State<MainSearchPage> {
  List<RecipeModel> resultedRecipes = dummyRecipes;
  final TextEditingController _controller = TextEditingController();

  void search(String query) {
    final results = dummyRecipes.where((recipe) {
      final lowerQuery = query.toLowerCase();
      return recipe.name.toLowerCase().contains(lowerQuery) ||
          recipe.category.any((cat) => cat.toLowerCase().contains(lowerQuery));
    }).toList();

    setState(() {
      resultedRecipes = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            TextField(
              controller: _controller,
              onChanged: search,
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: "Search recipes...",
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear, color: Colors.white),
                  onPressed: () {
                    _controller.clear();
                    search("");
                  },
                ),
                hintStyle: const TextStyle(color: Colors.white),
                filled: true,
                fillColor: const Color(0xFFECC856),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFECC856),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const WhatsInKitchenPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "What’s In Your Kitchen?",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFECC856),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    // TODO: Add filter logic if needed
                  },
                  icon: const Icon(Icons.filter_list, color: Colors.white),
                  label: const Text(
                    "Filter",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: resultedRecipes.isEmpty
                  ? const Center(child: Text("No results found"))
                  : ListView.builder(
                      itemCount: resultedRecipes.length,
                      itemBuilder: (context, index) {
                        return SearchedItem(
                          searchResult: resultedRecipes[index],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
