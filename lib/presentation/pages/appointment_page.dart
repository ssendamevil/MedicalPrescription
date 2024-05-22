import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_prescription/presentation/components/appointment_cards_item.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(75),
        child: AppBar(
          backgroundColor: const Color(0xff199A8E),
          scrolledUnderElevation: 0,
          title: Text(
            "Treatment Scheme",
            style: GoogleFonts.montserrat(
              // fontSize: 18.0,
              // fontWeight: FontWeight.w700,
              color: Colors.white
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30)
            )
          ),
          centerTitle: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 25, left: 25, bottom: 0),
              child: Row(
                children: [
                  Text(
                    "Active",
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Text("10",
                    style: GoogleFonts.montserrat(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff999999)
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 550,
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return const AppointmentCardsItem();
                },
                separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 20,),
                itemCount: 10
              )
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, right: 25, left: 25, bottom: 0),
              child: Row(
                children: [
                  Text(
                    "Realized",
                    style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Text("5",
                    style: GoogleFonts.montserrat(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff999999)
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )
    );
  }

}

