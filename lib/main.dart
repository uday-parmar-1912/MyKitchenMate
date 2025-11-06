import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mykitchenapp/bottom_navigation.dart';
import 'package:mykitchenapp/screens/splash.dart';
import 'package:mykitchenapp/screens/startup/intro_page.dart';
import 'package:mykitchenapp/screens/startup/login.dart';
import 'firebase_options.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(),
          scaffoldBackgroundColor: const Color.fromRGBO(248, 244, 235, 1),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromRGBO(248, 244, 235, 1),
          ),
        ),
        home: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const SplashScreen();
            }
            // FirebaseAuth.instance.signOut();
            if (snapshot.hasData && snapshot.data != null) {
              if (snapshot.hasError || !snapshot.hasData) {
                return Login();
              }

              return const Navigate();
            }

            return const IntroPage();
          },
        ),
      ),
    ),
  );
}

// void main() {
//   runApp(const ProviderScope(child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MealScreen(),
//     );
//   }
// }
