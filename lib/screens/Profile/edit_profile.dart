import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mykitchenapp/widgets/appbar.dart';

class EditProfilePage extends ConsumerStatefulWidget {
  const EditProfilePage({super.key});

  @override
  ConsumerState<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends ConsumerState<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController nameController = TextEditingController();
  late final TextEditingController usernameController = TextEditingController();
  late final TextEditingController phoneController = TextEditingController();
  late final TextEditingController emailController = TextEditingController();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError || !snapshot.hasData || !snapshot.data!.exists) {
          return const Scaffold(
            body: Center(child: Text("Failed to load user data.")),
          );
        }

        final data = snapshot.data!.data() as Map<String, dynamic>;

        nameController.text = data['name'] ?? '';
        usernameController.text = data['username'] ?? '';
        emailController.text = data['email'] ?? '';
        phoneController.text = data['mobile_number'] ?? '';

        return Scaffold(
          appBar: CustomAppbar("Edit Profile"),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 48),
            child: Form(
              key: _formKey,
              child: ListView(
                children: [
                  const SizedBox(height: 10),
                  _buildTextField('Full Name', nameController),
                  const SizedBox(height: 10),
                  _buildTextField('Username', usernameController),
                  const SizedBox(height: 16),
                  _buildTextField(
                    'Mobile Number',
                    phoneController,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),

                  const SizedBox(height: 32),
                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(86, 106, 79, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: isLoading
                          ? null
                          : () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                final uid =
                                    FirebaseAuth.instance.currentUser!.uid;
                                    setState(() {
                                      isLoading = true;
                                    });

                                await FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(uid)
                                    .update({
                                      'name': nameController.text,
                                      'username': usernameController.text,
                                      'mobile_number': phoneController.text,
                                    });
                                isLoading = false;
                                Navigator.pop(context);
                              }
                            },
                      child: isLoading ? CircularProgressIndicator(color: Color.fromRGBO(86, 106, 79, 1),) : const Text(
                        'Save',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTextField(
    String label,
    TextEditingController controller, {
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: (value) {
            if (value == null ||
                value.isEmpty ||
                value.length <= 1 ||
                value.length >= 50) {
              return 'Enter a valid $label';
            }
            if (label == "Email" &&
                (!value.contains('@') || !value.contains("gmail.com"))) {
              return "Enter correct Email address";
            }
            if (label == "Mobile Number" && value.length != 10) {
              return "Enter correct Mobile number";
            }
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(100, 160, 160, 150),
            contentPadding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 12,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
