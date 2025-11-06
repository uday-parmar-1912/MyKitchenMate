import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:mykitchenapp/providers/profile_dits.dart';
import 'package:mykitchenapp/widgets/appbar.dart';
import 'package:mykitchenapp/widgets/text_enter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebase = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;

final uid = FirebaseAuth.instance.currentUser!.uid;

class Signup extends ConsumerStatefulWidget {
  const Signup({super.key});
  @override
  ConsumerState<Signup> createState() => _SignupState();
}

class _SignupState extends ConsumerState<Signup> {
  bool isChecked = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar("Sign Up"),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TextEnter("Full Name", "Enter Your Name"),
                    const SizedBox(height: 5),
                    const TextEnter("Username", ""),
                    const SizedBox(height: 5),
                    const TextEnter("Email", "example@gmail.com"),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Expanded(
                          child: const TextEnter("Mobile Number", "9898989898"),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: const TextEnter(
                            "Date Of Birth",
                            "DD / MM / YYYY",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    TextEnter(
                      "Password",
                      "password",
                      contoller: passwordController,
                      isController: true,
                    ),
                    const SizedBox(height: 5),
                    TextEnter(
                      "Confirm Password",
                      "confirm password",
                      isController: true,
                      contoller: confirmPasswordController,
                      passwordCon: passwordController,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: isLoading
                    ? null
                    : () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          final list = ref.read(profileDitsProvider);
                          print("🟡 Full form data: $list");
                          setState(() {
                            isLoading = true;
                          });

                          try {
                            print(
                              "🟢 Trying to sign up with: ${list["Email"]}, ${list["Password"]}",
                            );
                            final userCredential = await firebase
                                .createUserWithEmailAndPassword(
                                  email: list["Email"]!,
                                  password: list["Password"]!,
                                );
                            print(
                              "✅ User created: ${userCredential.user?.uid}",
                            );
                            final uid = userCredential.user!.uid;
                            await firestore.collection('users').doc(uid).set({
                              'name': list["Full Name"] ?? "",
                              'email': list["Email"] ?? "",
                              'username': list["Username"] ?? "",
                              'DOB': list["Date Of Birth"] ?? "",
                              'mobile_number': list["Mobile Number"] ?? "",
                              'createdAt': Timestamp.now(),
                            });

                            print("📦 Data saved to Firestore!");
                            Navigator.pop(context);
                          } on FirebaseAuthException catch (error) {
                            if (error.code == 'email-already-in-use') {}
                            print(
                              "❌ Signup error: ${error.code} -> ${error.message}",
                            );
                            showDialog(
                              context: context,
                              builder: (ctx) => AlertDialog(
                                title: const Text("Signup Error"),
                                content: Text(
                                  error.message ?? "An unknown error occurred.",
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () => Navigator.of(ctx).pop(),
                                    child: const Text("OK"),
                                  ),
                                ],
                              ),
                            );
                          } finally {
                            setState(() => isLoading = false);
                          }
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
