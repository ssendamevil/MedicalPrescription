import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 70,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1.0, color: const Color(0xffD7D7D7)),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                offset: Offset(3, 3),
                blurRadius: 10,
                color: Color(0xffE7E7E7)
            ),
            BoxShadow(
                offset: Offset(-2, 3),
                blurRadius: 10,
                color: Color(0xffE7E7E7)
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("№1234567", style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),),
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: const Color(0xffA8FF92)
              ),
              child: Center(
                  child: Text(
                    "Approved",
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff177500)
                    )
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
