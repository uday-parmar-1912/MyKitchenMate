import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mykitchenapp/api/api_service.dart';
import 'package:mykitchenapp/modals/meals.dart';


class MealNotifier extends AsyncNotifier<List<Meals>> {
  final ApiService apiService = ApiService();

  @override
  Future<List<Meals>> build() async {
    return await fetchData("");
  }

  Future<List<Meals>> fetchData(String query) async {
    state = const AsyncLoading();
    try {
      final data = await apiService.fetchData(query);
      state = AsyncData(data);
      return data;
    } catch (e, st) {
      state = AsyncError(e, st);
      return [];
    }
  }
}

final mealProvider = AsyncNotifierProvider<MealNotifier, List<Meals>>(() {
  return MealNotifier();
});
