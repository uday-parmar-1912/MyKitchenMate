import 'package:flutter/material.dart';

class WhatsInKitchenPage extends StatefulWidget {
  const WhatsInKitchenPage({super.key});

  @override
  State<WhatsInKitchenPage> createState() => _WhatsInKitchenPageState();
}

class _WhatsInKitchenPageState extends State<WhatsInKitchenPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "What's In\nMy Kitchen?",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF566A4F),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Enter Ingredients To Find Recipes",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF566A4F),
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 40),
            TextField(
              cursorColor: const Color(0xFF566A4F),
              decoration: const InputDecoration(
                hintText: "Enter The Ingredients",
                hintStyle: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF566A4F),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF566A4F)),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
              child: SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF566A4F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {
                    
                  },
                  child: const Text(
                    "Find Recipes",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Divider(thickness: 1, color: Color(0xFF566A4F),),
          ],
        ),
      ),
    );
  }
}
