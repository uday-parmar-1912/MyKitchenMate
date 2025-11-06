import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mykitchenapp/dummy_data/categories_data.dart';
import 'package:mykitchenapp/dummy_data/sample_recipes.dart';
import 'package:mykitchenapp/modals/recipe_model.dart';
import 'package:mykitchenapp/widgets/appbar.dart';
import 'package:mykitchenapp/widgets/itemgrid.dart';



class LunchPage extends StatefulWidget {
  const LunchPage({required this.category, super.key});
  final String category;
  @override
  State<LunchPage> createState() => _LunchPageState();
}

class _LunchPageState extends State<LunchPage> {
  List<String> cat = categories.map((c) => c.name).toList();

  late String title = "Lunch";

  @override
  void initState() {
    super.initState();
    title = widget.category;
    if (cat.contains(title)) {
      cat.remove("Traditional");
    } else {
      cat = traditional.map((c) => c.name).toList();
    }
    cat.remove(title);
    cat.insert(0, title);
  }

  @override
  Widget build(BuildContext context) {
    List<RecipeModel> selectedRecipes = dummyRecipes
        .where((recipe) => recipe.category.contains(title))
        .toList();
    return Scaffold(
      appBar: CustomAppbar(title),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (String c in cat)
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: c == title
                            ? const Color.fromRGBO(236, 200, 86, 1)
                            : const Color.fromRGBO(248, 244, 235, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          title = c;
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 7),
                        child: Text(
                          c,
                          style: c == title
                              ? GoogleFonts.poppins(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 17)
                              : GoogleFonts.poppins(
                                  color: const Color.fromRGBO(86, 106, 79, 1),
                                ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: Itemgrid(
                selectedRecipes: selectedRecipes,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
