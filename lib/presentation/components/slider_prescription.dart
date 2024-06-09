import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:medical_prescription/domain/entities/prescription/prescription.dart';
import 'package:medical_prescription/presentation/app.dart';
import 'package:medical_prescription/presentation/components/status_label.dart';
import 'package:medical_prescription/presentation/screens/patient/prescription_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SliderPrescriptions extends StatelessWidget {
  const SliderPrescriptions({Key? key, required this.prescs}) : super(key: key);
  final List<PrescriptionEntity> prescs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: index==0? const EdgeInsets.only(left: 20.0, right: 5.0,top: 15.0, bottom: 15.0) :
            index==prescs.length-1? const EdgeInsets.only(left: 5.0, right: 20.0,top: 15.0, bottom: 15.0) : const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
            child: Container(
              width: MediaQuery.of(context).size.width-40,
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      StatusLabel(status: AppLocalizations.of(context)!.treatment_label_realized, isOrder: false, ),
                      const Text("19.10.2024")
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    "City polyclinic No.4",
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700,
                      fontSize: 16
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(AppLocalizations.of(context)!.label_doctor, style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),),
                  const Text("Berikov Berik Berikulu"),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppLocalizations.of(context)!.label_discharged, style: GoogleFonts.montserrat(fontWeight: FontWeight.w600),),
                          const Text("1 medication, 15 products"),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => PrescriptionScreen(prescriptionEntity: prescs.elementAt(index),)));
                        },
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          )),
                          surfaceTintColor: const MaterialStatePropertyAll(Colors.black),
                          backgroundColor: const MaterialStatePropertyAll(Color(0xff199A8E)),
                          foregroundColor: const MaterialStatePropertyAll(Colors.white),
                          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                          textStyle: MaterialStatePropertyAll(GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14)),
                        ),
                        child: Text(AppLocalizations.of(context)!.open_btn),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
        itemCount: prescs.length,
      )
    );
  }
}
