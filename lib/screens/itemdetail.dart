import 'package:flutter/material.dart';
import 'package:mykitchenapp/providers/favs.dart';
import '../modals/recipe_model.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemDetailPage extends ConsumerStatefulWidget {
  const ItemDetailPage({super.key, required this.recipe});
  final RecipeModel recipe;
  @override
  ConsumerState<ItemDetailPage> createState() => _ItemDetailPageState();
}

class _ItemDetailPageState extends ConsumerState<ItemDetailPage> {
  @override
  Widget build(BuildContext context) {
    final recipe = widget.recipe;
    bool wasAdded = ref.read(favouritesProvider).contains(recipe);
    const greenColor = Color.fromRGBO(86, 106, 79, 1);
    const yellowColor = Color.fromRGBO(236, 200, 86, 1);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, color: greenColor, size: 30),
          ),
        ),
        centerTitle: true,
        title: Text(
          recipe.name,
          style: GoogleFonts.poppins(
            color: greenColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () {
               setState(() {
                    ref
                        .read(favouritesProvider.notifier)
                        .addToFav(recipe);
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          !wasAdded
                              ? "Added to favourites"
                              : "Removed from favourites",
                        ),
                      ),
                    );
                  });
              },
              child: CircleAvatar(
                radius: 15,
                backgroundColor: wasAdded
                    ? const Color.fromARGB(255, 203, 44, 8)
                    : Color.fromRGBO(86, 106, 79, 1),
                child: Icon(
                  Icons.favorite_border,
                  color: Color.fromRGBO(255, 255, 255, 1),
                  size: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: InkWell(
              onTap: null,
              child: CircleAvatar(
                radius: 15,
                backgroundColor: Color.fromRGBO(86, 106, 79, 1),
                child: Icon(
                  Icons.share_outlined,
                  color: Color.fromRGBO(255, 255, 255, 1),
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  alignment: AlignmentDirectional.bottomStart,
                  height: 250,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 13,
                  ),
                  decoration: const BoxDecoration(
                    color: yellowColor,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          recipe.name,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.star_rounded,
                        size: 18,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        recipe.rating.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(width: 12),
                      const Icon(
                        Icons.comment_outlined,
                        size: 18,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        recipe.reviews.length.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    recipe.imagePath,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
                const Positioned(
                  top: 70,
                  left: 140,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 25,
                    child: Icon(Icons.play_arrow, size: 30, color: greenColor),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text(
                  "Details",
                  style: GoogleFonts.poppins(
                    color: greenColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(Icons.timer_outlined, size: 13, color: Colors.black),
                const SizedBox(width: 4),
                Text(
                  recipe.time,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                recipe.shortDescription,
                style: GoogleFonts.poppins(fontSize: 14),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Ingredients",
              style: GoogleFonts.poppins(
                color: greenColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            for (String ingredient in recipe.ingredients)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 2,
                  horizontal: 10,
                ),
                child: Text(
                  "• $ingredient",
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
              ),
            const SizedBox(height: 20),
            const Text(
              "Easy Steps",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: greenColor,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            ...recipe.steps.map((step) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: yellowColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "• ",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Expanded(
                      child: Text(
                        step,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(235, 214, 184, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      "Give Review",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(235, 214, 184, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      "Add to Calender",
                      style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
