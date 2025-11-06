import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppbar(this.text, {super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 9),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Color.fromRGBO(86, 106, 79, 1),
              size: 30,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          text,
          style: GoogleFonts.poppins(
            color: const Color.fromRGBO(86, 106, 79, 1),
            fontWeight: FontWeight.w600,
          ),
        ),
      );
  }
  @override
Size get preferredSize => const Size.fromHeight(kToolbarHeight);

}