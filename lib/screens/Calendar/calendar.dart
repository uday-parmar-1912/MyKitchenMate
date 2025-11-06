import 'package:flutter/material.dart';
import 'package:mykitchenapp/screens/Calendar/RecipeCard.dart';
import 'package:mykitchenapp/screens/Categories/category.dart';

class PlanYourDayScreen extends StatefulWidget {
  const PlanYourDayScreen({super.key});

  @override
  State<PlanYourDayScreen> createState() => _PlanYourDayScreenState();
}

class _PlanYourDayScreenState extends State<PlanYourDayScreen> {
  final List<Map<String, dynamic>> recipes = [
    {
      'title': 'Bhindi Masala',
      'image': 'assets/images/Traditionals/Gujarati.png',
      'done': false,
    },
    {
      'title': 'Puri Sabzi',
      'image': 'assets/images/Traditionals/Gujarati.png',
      'done': false,
    },
    {
      'title': 'Vada Paav',
      'image': 'assets/images/Traditionals/Gujarati.png',
      'done': false,
    },
  ];

  DateTime selectedDate = DateTime.now();

  List<DateTime> getVisibleWeek(DateTime current) {
    final startOfWeek = current.subtract(Duration(days: current.weekday % 7));
    return List.generate(7, (index) => startOfWeek.add(Duration(days: index)));
  }

  int index = 1; // Assuming this is the index for the Calendar tab
  @override
  Widget build(BuildContext context) {
    final weekDates = getVisibleWeek(selectedDate);
    final String currMonth = _getMonthName(selectedDate.month);
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDF9),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 16),
              const Text(
                'Plan Your Day',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              // Month display
              Text(currMonth, style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              // Horizontal calendar view (week view)
              SizedBox(
                height: 72,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    final date = weekDates[index];
                    final isSelected =
                        date.day == selectedDate.day &&
                        date.month == selectedDate.month &&
                        date.year == selectedDate.year;

                    return GestureDetector(
                      onTap: () {
                        setState(() => selectedDate = date);
                      },
                      child: Container(
                        width: 48,
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected
                              ? const Color(0xFF4E6444)
                              : Colors.grey.shade300,
                        ),
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _getWeekdayShort(date.weekday),
                              style: const TextStyle(fontSize: 12),
                            ),
                            Text(
                              '${date.day}',
                              style: TextStyle(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Recipies',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Recipe Cards
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: recipes.length,
                  itemBuilder: (context, index) {
                    final recipe = recipes[index];
                    return RecipeCard(
                      title: recipe['title'],
                      imagePath: recipe['image'],
                      isChecked: recipe['done'],
                      onCheck: (val) {
                        setState(() {
                          recipes[index]['done'] = val;
                        });
                      },
                      onDelete: () {
                        setState(() {
                          recipes.removeAt(index);
                        });
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 80),
            ],
          ),
          // FAB
          Positioned(
            bottom: 100,
            right: 24,
            child: FloatingActionButton(
              backgroundColor: const Color(0xFFF1C93B),
              onPressed: () {
                Navigator.push(
                  context,
                  // MaterialPageRoute(builder: (_) => const Category()),
                  MaterialPageRoute(
                    builder: (context) => const Category(title: 'Categories'),
                  ),
                );
              },
              child: const Icon(Icons.add, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  String _getWeekdayShort(int weekday) {
    const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return days[weekday % 7];
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }
}

// Dummy Categories Page (replace with actual implementation)
// class CategoriesPage extends StatelessWidget {
//   const CategoriesPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Categories')),
//       body: const Center(child: Text('Choose a category to add recipes')),
//     );
//   }
// }
