import 'package:flutter/material.dart';
import 'package:mykitchenapp/dummy_data/categories_data.dart';
import 'package:mykitchenapp/screens/Categories/lunch.dart';
import 'package:mykitchenapp/widgets/appbar.dart';
import 'package:mykitchenapp/widgets/categories_item.dart';

class Category extends StatefulWidget {
  const Category({super.key, required this.title});
  final String title;

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  late String title;
  void _selectCategory(BuildContext context, String category) {
    if (category == "Traditional") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (ctx) {
          return Category(
            title: category,
          );
        }),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (ctx) {
          return LunchPage(
            category: category,
          );
        }),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    title = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
            centerTitle: true,
            title: Text(
              title,
              style: TextStyle(
                color: Color.fromRGBO(86, 106, 79, 1),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.80,
          crossAxisSpacing: 20,
        ),
        children: [
          ...(title == "Categories")
              ? categories.map((cat) {
                  return CategoriesItem(
                    image: cat.image,
                    text: cat.name,
                    fun: () {
                      return _selectCategory(context, cat.name);
                    },
                  );
                })
              : traditional.map((cat) {
                  return CategoriesItem(
                    image: cat.image,
                    text: cat.name,
                    fun: () => _selectCategory(
                      context,
                      cat.name,
                    ),
                  );
                })
        ],
      ),
    );
  }
}
