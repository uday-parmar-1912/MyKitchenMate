import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mykitchenapp/dummy_data/sample_recipes.dart';
import 'package:mykitchenapp/providers/favs.dart';
import 'package:mykitchenapp/screens/Trending_Page/trending_page.dart';
import 'package:mykitchenapp/screens/settings/history.dart';
import 'package:mykitchenapp/screens/splash.dart';
import 'package:mykitchenapp/widgets/item_design.dart';
import 'package:mykitchenapp/widgets/itemgrid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final uid = FirebaseAuth.instance.currentUser!.uid;

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final double appBarHeight = AppBar().preferredSize.height;

  @override
  Widget build(BuildContext context) {
    final favRecipes = ref.watch(favouritesProvider);

    // final String name = list["Full Name"]!;

    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection('users').doc(uid).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen();
        }
        if (snapshot.hasError || !snapshot.hasData || !snapshot.data!.exists) {
          return const Scaffold(
            body: Center(
              child: Text(
                "Failed to load user data.",
                style: TextStyle(color: Color.fromRGBO(86, 106, 79, 1)),
              ),
            ),
          );
        }
        final data = snapshot.data!.data() as Map<String, dynamic>;
        return Scaffold(
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data["name"],
                    style: TextStyle(color: Color.fromRGBO(86, 106, 79, 1)),
                  ),
                  const Text(
                    "What are you cooking today?",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 30),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (ctx) => TrendingRecipesPage()),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                      height: 300,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Trending Recipe ",
                                style: GoogleFonts.poppins(
                                  color: Color.fromRGBO(86, 106, 79, 1),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Color.fromRGBO(86, 106, 79, 1),
                                size: 15,
                                weight: 10,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Expanded(
                            child: ItemDesign(
                              selectedRecipes: dummyRecipes[0],
                              currentPage: "home",
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return History(
                            listOfRecipes: favRecipes,
                          );
                        },
                      ),
                    );
                  },
                  child: Container(
                    height: favRecipes.length == 0 ? 80 : 255,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(235, 214, 185, 40),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Your Recipes",
                                style: GoogleFonts.poppins(
                                  color: const Color.fromARGB(
                                    255,
                                    255,
                                    255,
                                    255,
                                  ),
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "See All ->",
                                style: GoogleFonts.poppins(
                                  color: const Color.fromARGB(
                                    255,
                                    255,
                                    255,
                                    255,
                                  ),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: favRecipes.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 10.0),
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.network(
                                          favRecipes[index].imagePath,
                                          height: 150,
                                          width: 120,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        favRecipes[index].name,
                                        style: const TextStyle(
                                          color: Color.fromRGBO(86, 106, 79, 1),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    "Recently Added",
                    style: GoogleFonts.poppins(
                      color: const Color.fromRGBO(86, 106, 79, 1),
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Itemgrid(selectedRecipes: dummyRecipes, currentPage: "Home"),
              ],
            ),
          ),
        );
      },
    );
  }
}
