import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_prescription/presentation/screens/prescription_screen.dart';

class AppointmentCardsItem extends StatefulWidget {
  const AppointmentCardsItem({Key? key}) : super(key: key);

  @override
  State<AppointmentCardsItem> createState() => _AppointmentCardsItemState();
}

class _AppointmentCardsItemState extends State<AppointmentCardsItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
              offset: Offset(4, 4),
              color: Color(0xffE7E7E7),
              blurRadius: 7
          ),
          BoxShadow(
              offset: Offset(-3, -3),
              color: Color(0xffE7E7E7),
              blurRadius: 7
          ),
        ],
        border: Border.all(
            color: const Color(0xffD9D9D9)
        ),
        color: Colors.white,
      ),
      child: InkWell(
        onTap: (){
          Navigator.push(context, CupertinoPageRoute(builder: (context) => PrescriptionScreen()));
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffA8FFFC),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: Text(
                    "Valid til 25.05.2024",
                    style: GoogleFonts.montserrat(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff3BA39F)
                    ),
                  ),
                ),
                Text("from 23.03.2024",
                  style: GoogleFonts.montserrat(
                    fontSize: 12,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Therapist",
                      style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    Text(
                      "Berikov B.B.",
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xffB0B0B0)
                      ),
                    ),
                    Text("City polyclinic No/4",
                      style: GoogleFonts.montserrat(
                          fontSize: 16,
                          fontWeight: FontWeight.w600
                      ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: const Color(0xff0C7E74)
                    ),
                  ),
                  height: 22,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Пасиреотид",
                    style: GoogleFonts.montserrat(
                        color: const Color(0xff13665F),
                        fontSize: 13,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: const Color(0xff0C7E74)
                    ),
                  ),
                  height: 22,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Октреотид",
                    style: GoogleFonts.montserrat(
                        color: const Color(0xff13665F),
                        fontSize: 13,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text("Recomendations",
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w700,
                            fontSize: 16
                        ),
                      ),
                    ),
                    Text("5 products available",
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          color: const Color(0xff969696)
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                    onPressed: (){},
                    child: const Text("See in store")
                )
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 220,
                  width: 150,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: const Color(0xffD9D9D9)
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.network(
                        "https://st.europharma.kz/cache/product/2135/x248_5f6874ea35695.png",
                        height: 60,
                        width: 100,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Mercacin", style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600),),
                          Text("500 mg/2 ml No. 1 flag", style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 10,),
                          Text("1850₸", style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w700), textAlign: TextAlign.end,)
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  height: 220,
                  width: 150,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                        color: const Color(0xffD9D9D9)
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.network(
                        "https://st.europharma.kz/cache/product/2135/x248_5f6874ea35695.png",
                        height: 60,
                        width: 100,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Mercacin", style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600),),
                          Text("500 mg/2 ml No. 1 flag", style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w500)),
                          const SizedBox(height: 10,),
                          Text("1850₸", style: GoogleFonts.montserrat(fontSize: 16, fontWeight: FontWeight.w700), textAlign: TextAlign.end,)
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
