import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mykitchenapp/modals/meals.dart';

class ApiService {
  String apiUrl = "https://www.themealdb.com/api/json/v1/1/search.php?s=";

  Future<List<Meals>> fetchData(String query) async {
    final response = await http.get(Uri.parse("$apiUrl$query"));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      
      if (data["meals"] == null) {
        return [];
      }

       List<Meals> list = List<Meals>.from(
        data["meals"].map((meal) => Meals.fromJson(meal)),
      );
      return list;
    } else {
      throw Exception("Cannot load data from the meals");
    }
  }
}
