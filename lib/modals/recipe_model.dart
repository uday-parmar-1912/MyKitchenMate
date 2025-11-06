class RecipeModel {
  final String id; 
  final String name;
  final String imagePath; 
  final double rating;
  final List<String> category;
  final String details;
  final List<String> ingredients;
  final List<String> steps; 
  final String time; 
  final Map<String, String> nutrients; 
  final List<String> reviews;
  final String author; 
  final  String shortDescription; 

  const RecipeModel({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.rating,
    required this.category,
    required this.details,
    required this.ingredients,
    required this.steps,
    required this.time,
    required this.nutrients,
    required this.reviews,
    required this.author,
    required this.shortDescription,
  });
}




