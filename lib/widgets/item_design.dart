import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mykitchenapp/modals/recipe_model.dart';
import 'package:mykitchenapp/screens/itemdetail.dart';

class ItemDesign extends ConsumerStatefulWidget {
  const ItemDesign({
    super.key,
    required this.selectedRecipes,
    required this.currentPage,
  });

  final RecipeModel selectedRecipes;
  final String? currentPage;

  @override
  ConsumerState<ItemDesign> createState() => _ItemDesignState();
}

class _ItemDesignState extends ConsumerState<ItemDesign> {
  @override
  Widget build(BuildContext context) {
    final currentPage = widget.currentPage;
    return Stack(
      children: [
        Positioned(
          bottom: 15,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(left: 9.0, right: 9),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color.fromRGBO(86, 106, 79, 1),
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 40, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.selectedRecipes.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      widget.selectedRecipes.shortDescription,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 0, 0, 0),
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 2,
                    ),
                    const SizedBox(height: 15),
                    Opacity(
                      opacity: 0.7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.star_rate_rounded,
                                size: 18,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                widget.selectedRecipes.rating.toString(),
                                style: const TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                          // const SizedBox(width: 15),

                          Row(
                            children: [
                              const Icon(
                                Icons.timer_outlined,
                                size: 18,
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                widget.selectedRecipes.time,
                                style: const TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    ItemDetailPage(recipe: widget.selectedRecipes),
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                widget.selectedRecipes.imagePath,
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
