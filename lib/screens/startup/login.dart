import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:mykitchenapp/bottom_navigation.dart';
import 'package:mykitchenapp/screens/startup/signup.dart';
import 'package:mykitchenapp/widgets/appbar.dart';
import 'package:mykitchenapp/widgets/text_enter.dart';

final firebase = FirebaseAuth.instance;

class Login extends ConsumerStatefulWidget {
  const Login({super.key});
  @override
  ConsumerState<Login> createState() => _LoginState();
}

class _LoginState extends ConsumerState<Login> {
  bool isChecked = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar("Log In"),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextEnter(
                      "Email",
                      "example@gmail.com",
                      contoller: emailController,
                      isController: true,
                    ),
                    const SizedBox(height: 20),
                    TextEnter(
                      "Password",
                      "Password",
                      contoller: passwordController,
                      isController: true,
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
              ListTile(
                title: const Text(
                  "Remember me",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                leading: Checkbox(
                  activeColor: const Color.fromRGBO(86, 106, 79, 1),
                  value: isChecked,
                  onChanged: (bool? val) {
                    setState(() {
                      isChecked = !isChecked;
                    });
                  },
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () async {
                        setState(() {
                          isLoading = true;
                        });
                        try {
                          final UserCredentials = await firebase
                              .signInWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text,
                              );

                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Navigate()),
                            (route) => false,
                          );
                        } on FirebaseAuthException catch (error) {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Enter Login Details"),
                              content: const Text(
                                "Please enter correct login details",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text("OK"),
                                ),
                              ],
                            ),
                          );
                        } finally {
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                  backgroundColor: const Color.fromRGBO(86, 106, 79, 1),
                ),
                child: isLoading
                    ? CircularProgressIndicator(
                        color: Color.fromRGBO(86, 106, 79, 1),
                      )
                    : Text(
                        "Log In",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                        ),
                      ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Signup()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                  backgroundColor: const Color.fromRGBO(86, 106, 79, 1),
                ),
                child: Text(
                  "Sign Up",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 19,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
