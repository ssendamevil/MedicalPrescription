import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:medical_prescription/presentation/screens/patient/prescription_screen.dart';

class SliderPrescriptions extends StatelessWidget {
  const SliderPrescriptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index){
          return Padding(
            padding: index==0? const EdgeInsets.only(left: 20.0, right: 5.0,top: 15.0, bottom: 15.0) :
            index==3? const EdgeInsets.only(left: 5.0, right: 20.0,top: 15.0, bottom: 15.0) : const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
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
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: const Color(0xffA8FF92)
                        ),
                        child: Center(
                          child: Text("Realized",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff177500)
                            ),
                          )
                        ),
                      ),
                      const Text("19.10.2024")
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    "City polyclinic No.4",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 10,),
                  const Text("Doctor"),
                  const Text("Berikov Berik Berikulu"),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Discharged"),
                          Text("1 medication, 15 products"),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, CupertinoPageRoute(builder: (context) => const PrescriptionScreen()));
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
                        child: const Text("Open"),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
        itemCount: 4,
      )
    );
  }
}
