import 'package:mykitchenapp/modals/recipe_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavouritesNotifier extends StateNotifier<List<RecipeModel>> {
  FavouritesNotifier() : super([]);

  bool addToFav(RecipeModel recipe) {
    final isFav = state.contains(recipe);
    if (isFav) {
      state = state.where((element) => element.id != recipe.id).toList();
      return false;
    }
    state = [...state, recipe];

    return true;
  }
}

final favouritesProvider =
    StateNotifierProvider<FavouritesNotifier, List<RecipeModel>>((ref) {
      return FavouritesNotifier();
    });
