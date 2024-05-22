import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";

import "../app.dart";

Widget sectionLabels(BuildContext context, String text, bool hasButton, int index){
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: GoogleFonts.nunitoSans(
            fontSize: 18.0,
            fontWeight: FontWeight.w700
          ),
        ),
        hasButton ?
        TextButton(
          onPressed: (){
            selectedIndexGlobal.value = index;
          },
          style: const ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(Colors.black),
              overlayColor: MaterialStatePropertyAll(Colors.transparent)
          ),
          child: Text(
            "See all",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ) :
        Container()
      ],
    ),
  );
}