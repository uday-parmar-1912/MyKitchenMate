import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem(
      {super.key, required this.image, required this.text, required this.fun});
  final String text;
  final Image image;
  final void Function() fun;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            fun();
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.61),
            child: image,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          text,
          style: GoogleFonts.poppins(
            color: const Color.fromRGBO(50, 32, 28, 1),
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        )
      ],
    );
  }
}
