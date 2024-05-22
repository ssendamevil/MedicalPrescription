import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class InstructionItem extends StatefulWidget {
  const InstructionItem({Key? key}) : super(key: key);

  @override
  State<InstructionItem> createState() => _InstructionItemState();
}

class _InstructionItemState extends State<InstructionItem> {
  bool show = false;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: (){
        setState(() {
          show =!show;
        });
      },
      style: ButtonStyle(
          foregroundColor: const MaterialStatePropertyAll(Colors.black),
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
          padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 10, horizontal: 0)),
          shape: const MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
          textStyle: MaterialStatePropertyAll(
              GoogleFonts.montserrat(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500
              )
          )
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Специальные указания"),
              RotatedBox(
                  quarterTurns: show? 1 : 0,
                  child: const Icon(Iconsax.arrow_right_3,size: 20,)
              ),
            ],
          ),
          show?
            Column(
              children: [
                const SizedBox(height: 10,),
                Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                  style: GoogleFonts.montserrat(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xff606A69)
                  ),
                ),
              ],
            )
              : Container()
        ],
      ),
    );
  }
}
