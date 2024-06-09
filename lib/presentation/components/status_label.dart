import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatusLabel extends StatelessWidget {
  const StatusLabel({Key? key, required this.status, required this.isOrder}) : super(key: key);
  final String status;
  final bool isOrder;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: !isOrder? const EdgeInsets.symmetric(horizontal: 10, vertical: 5) : const EdgeInsets.symmetric(horizontal: 7, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          color: const Color(0xffA8FF92)
      ),
      child: Center(
          child: Text(
            status,
            style: !isOrder?
            GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                color: const Color(0xff177500)
            ) :
            GoogleFonts.montserrat(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: const Color(0xff177500)
            ),
          )
      ),
    );
  }
}
