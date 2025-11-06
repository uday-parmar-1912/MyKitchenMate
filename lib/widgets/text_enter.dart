import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mykitchenapp/providers/profile_dits.dart';

class TextEnter extends ConsumerWidget {
  const TextEnter(
    this.type,
    this.hint, {
    super.key,
    this.contoller,
    this.passwordCon,
    this.isController,
  });

  final String type;
  final String hint;
  final TextEditingController? contoller;
  final TextEditingController? passwordCon;
  final bool? isController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 13),
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 70,
          width: 350,
          child: TextFormField(
            controller: isController != null ? contoller : null,
            obscureText: type == "Confirm Password" || type == "Password"
                ? true
                : false,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  value.length >= 50 ||
                  value.length <= 1) {
                return "Enter appropriate value";
              }
              if (type == "Email" &&
                  (!value.contains('@') || !value.contains("gmail.com"))) {
                return "Enter correct Email address";
              }
              if (type == "Mobile Number" && value.length != 10) {
                return "Enter correct Mobile number";
              }
              if (type == "Password" && value.length < 6) {
                return "Password must be atleast 6 characters long";
              }
              if (type == "Confirm Password" &&
                  (contoller?.text != passwordCon?.text)) {
                return "Password and confirm password do not match";
              }
              return null;
            },
            onSaved: (newValue) {
              ref
                  .read(profileDitsProvider.notifier)
                  .profileDits(type, newValue!);
            },
            keyboardType: type == "Mobile Number"
                ? TextInputType.phone
                : type == "Email"
                ? TextInputType.emailAddress
                : TextInputType.text,
            cursorColor: Colors.white,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: const Color.fromRGBO(86, 106, 79, 1),
              hintStyle: const TextStyle(
                color: Color.fromARGB(187, 255, 255, 255),
                fontSize: 15,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              errorStyle: const TextStyle(fontSize: 12),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        // const SizedBox(height: 10),
      ],
    );
  }
}
