import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mykitchenapp/screens/startup/login.dart';
import 'package:mykitchenapp/widgets/appbar.dart';

class Languages extends StatefulWidget {
  const Languages({super.key, required this.goBack});
  final bool goBack;
  @override
  State<Languages> createState() {
    return _LanguagesState();
  }
}

class _LanguagesState extends State<Languages> {
  List<String> languages = [
    "English",
    "Hindi",
    "Bengali",
    "Gujarati",
    "Tamil",
    "Spanish",
    "French",
  ];

  String? val = "English";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar('Languages'),
      body: Padding(
        padding: const EdgeInsets.only(left: 8, top: 8, bottom: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                for (String lang in languages)
                  ListTile(
                    title: Text(
                      lang,
                      style: GoogleFonts.poppins(
                        color: const Color.fromRGBO(86, 106, 79, 1),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    leading: Radio<String>(
                      fillColor: WidgetStateProperty.resolveWith<Color>((
                        Set<WidgetState> states,
                      ) {
                        return const Color.fromRGBO(86, 106, 79, 1);
                      }),
                      value: lang,
                      groupValue: val,
                      onChanged: (String? lan) {
                        setState(() {
                          val = lan;
                        });
                      },
                    ),
                  ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                if (widget.goBack) {
                  Navigator.pop(context);
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
                backgroundColor: const Color.fromRGBO(86, 106, 79, 1),
              ),
              child: Text(
                "Done",
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
    );
  }
}
