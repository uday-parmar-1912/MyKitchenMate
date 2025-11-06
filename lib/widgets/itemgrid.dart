import 'package:flutter/material.dart';
import 'package:mykitchenapp/modals/recipe_model.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mykitchenapp/widgets/item_design.dart';

class Itemgrid extends ConsumerStatefulWidget {
  const Itemgrid({super.key, required this.selectedRecipes, this.currentPage});
  final List<RecipeModel> selectedRecipes;
  final String? currentPage;

  @override
  ConsumerState<Itemgrid> createState() => _ItemgridState();
}

class _ItemgridState extends ConsumerState<Itemgrid> {
  @override
  Widget build(BuildContext context) {
    final List<RecipeModel> selectedRecipes = widget.selectedRecipes;
    final String? currentPage = widget.currentPage;
    return GridView.builder(
      padding: currentPage == "Home"
          ? const EdgeInsets.symmetric(horizontal: 10)
          : const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),

      physics: currentPage == "Home"
          ? const NeverScrollableScrollPhysics()
          : null,
      shrinkWrap: currentPage == "Home" ? true : false,
      itemCount: selectedRecipes.length,
      itemBuilder: (context, index) {
        return ItemDesign(selectedRecipes: selectedRecipes[index], currentPage: currentPage);
      },
    );
  }
}
