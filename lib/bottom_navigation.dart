import 'package:flutter/material.dart';
import 'package:mykitchenapp/screens/Calendar/calendar.dart';
import 'package:mykitchenapp/screens/Categories/category.dart';
import 'package:mykitchenapp/screens/Profile/profile_page.dart';
import 'package:mykitchenapp/screens/Search/main_search.dart';
import 'package:mykitchenapp/screens/home_page.dart';

class Navigate extends StatefulWidget {
  const Navigate({super.key});

  @override
  State<Navigate> createState() => _NavigateState();
}

class _NavigateState extends State<Navigate> {
  int _selectedIndex = 2;

  final List<Widget> _pages = [
    PlanYourDayScreen(),
    MainSearchPage(),
    HomePage(),
    Category(title: "Categories"),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              const Color.fromARGB(255, 255, 255, 255),
              const Color.fromARGB(121, 255, 255, 255),
              const Color.fromARGB(18, 255, 255, 255),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 25,
            right: 25,
            top: 20,
            bottom: 20,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: NavigationBar(
              height: 50,
              backgroundColor: const Color.fromRGBO(86, 106, 79, 1),
              selectedIndex: _selectedIndex,
              indicatorColor: Color.fromRGBO(86, 106, 79, 1),
              onDestinationSelected: _onItemTapped,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              destinations: [
                NavigationDestination(
                  icon: Icon(
                    Icons.calendar_month_outlined,
                    color: _selectedIndex == 0 ? Colors.white : Colors.white38,
                  ),
                  label: '',
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.search,
                    color: _selectedIndex == 1 ? Colors.white : Colors.white38,
                  ),
                  label: '',
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.home,
                    color: _selectedIndex == 2 ? Colors.white : Colors.white38,
                  ),
                  label: '',
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.layers_outlined,
                    color: _selectedIndex == 3 ? Colors.white : Colors.white38,
                  ),
                  label: '',
                ),
                NavigationDestination(
                  icon: Icon(
                    Icons.person,
                    color: _selectedIndex == 4 ? Colors.white : Colors.white38,
                  ),
                  label: '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
