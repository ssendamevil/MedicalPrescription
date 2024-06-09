import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_prescription/domain/entities/prescription/prescription.dart';
import 'package:medical_prescription/presentation/components/appointment_cards_item.dart';

class AppointmentSection extends StatelessWidget {
  const AppointmentSection({Key? key, required this.sectionName, required this.prstns}) : super(key: key);
  final String sectionName;
  final List<PrescriptionEntity> prstns;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15, right: 25, left: 25, bottom: 0),
          child: Row(
            children: [
              Text(
                sectionName,
                style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w700
                ),
              ),
              const SizedBox(width: 10,),
              Text('${prstns.length}',
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
            height: sectionName == "Active" ? 550 : 260,
            color: Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
            child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return AppointmentCardsItem(prescriptionEntity: prstns.elementAt(index) );
                },
                separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 20,),
                itemCount: prstns.length
            )
        ),
      ],
    );
  }
}
