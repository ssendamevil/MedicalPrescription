import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/core/util/theme/Colors.dart';
import 'package:medical_prescription/presentation/pages/pharmacy/pharmacy_home_page.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({Key? key}) : super(key: key);

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          leading: IconButton(
              onPressed: (){
                pharmacyHomePageIndex.value=1;
              },
              icon: const Icon(Iconsax.arrow_left)
          ),
          title: const Text(
            "Рецепты",
          ),
          centerTitle: true,
          shape: Border(
              bottom: BorderSide(color: customBlack.shade100, width: 1)
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Номер рецепта:", style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 16.0),),
                  Text("№123468", style: GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: 16.0),)
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Дата выдачи:", style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 16.0),),
                  Text("17.05.2024", style: GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: 16.0),)
                ],
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Срок:", style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 16.0),),
                  Text("25.05.2024", style: GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: 16.0),)
                ],
              ),
              const SizedBox(height: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Действующие вещества:", style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 16.0),),
      
                ],
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: const Color(0xffF0F0F0),
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            height: 55,
            child: ElevatedButton(
              onPressed: () {
      
              },
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                )),
                surfaceTintColor: const MaterialStatePropertyAll(Colors.black),
                backgroundColor: const MaterialStatePropertyAll(Color(0xff198A8E)),
                foregroundColor: const MaterialStatePropertyAll(Colors.white),
                overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                textStyle: MaterialStatePropertyAll(GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18)),
              ),
              child: const Text("Утвердить"),
            ),
          ),
        ),
      ),
    );
  }
}
