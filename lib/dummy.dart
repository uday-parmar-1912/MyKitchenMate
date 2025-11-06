import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mykitchenapp/providers/meals_provider.dart';

class MealScreen extends ConsumerWidget {
  const MealScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealsAsync = ref.watch(mealProvider);
    print(mealsAsync);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Meals"),
        backgroundColor: Colors.deepOrange,
      ),
      body: mealsAsync.when(
        data: (meals) {
            print(meals.length);
          if (meals.isEmpty) {
            return const Center(child: Text("No meals found."));
          }


          return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              // print("Meal: ${meals.strMeal}");
              final meal = meals[index];
              print("Meal: ${meal.strMeal}");

              return Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(meal.strMealThumb ?? ''),
                  ),
                  title: Text(meal.strMeal ?? 'No Name'),
                  subtitle: Text(meal.strCategory ?? 'No Category'),
                ),
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
