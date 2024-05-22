import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class FAQItem extends StatefulWidget {
  const FAQItem({Key? key}) : super(key: key);

  @override
  State<FAQItem> createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){setState(() {
        show = !show;
      });},
      style: ButtonStyle(
          padding: const MaterialStatePropertyAll(EdgeInsets.only(top: 25)),
          surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
          backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
          foregroundColor: const MaterialStatePropertyAll(Colors.black),
          textStyle: MaterialStatePropertyAll(GoogleFonts.montserrat(fontSize: 16.0, fontWeight: FontWeight.w500))
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("What is electronic prescription?"),
              RotatedBox(
                quarterTurns: show? 1 : 0,
                child: const Icon(Iconsax.arrow_right_3,)
              ),
            ],
          ),
          const SizedBox(height: 10,),
          show?
            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
              style: GoogleFonts.montserrat(
                fontSize: 14.0,
                fontWeight: FontWeight.w500
              ),
            )
          : Container()
        ],
      ),
    );
  }
}
