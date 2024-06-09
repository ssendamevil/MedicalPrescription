import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TagItem extends StatelessWidget {
  const TagItem({Key? key, required this.tagName}) : super(key: key);
  final String tagName;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
            color: const Color(0xff0C7E74)
        ),
      ),
      height: 26,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        tagName,
        style: GoogleFonts.montserrat(
            color: const Color(0xff13665F),
            fontSize: 15,
            fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}
