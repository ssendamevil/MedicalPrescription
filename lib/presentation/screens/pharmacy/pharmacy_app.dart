import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/presentation/app.dart';
import 'package:medical_prescription/presentation/pages/pharmacy/pharmacy_home_page.dart';
import 'package:medical_prescription/presentation/screens/patient/patient_app.dart';
import 'package:medical_prescription/presentation/screens/pharmacy/profile_screen.dart';

class PharmacyApp extends StatefulWidget {
  const PharmacyApp({Key? key}) : super(key: key);

  @override
  State<PharmacyApp> createState() => _PharmacyAppState();
}

class _PharmacyAppState extends State<PharmacyApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedIndexGlobal,
      builder: (context,val, child){
        return SafeArea(
          child: Scaffold(
            body: [
              PharmacyHomePage(),
              const ProfileScreen()
            ][selectedIndexGlobalPharmacy.value],
            bottomNavigationBar: Container(
              height: 65,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15), topLeft: Radius.circular(15)),
                boxShadow: [
                  BoxShadow(color: Color(0xffB1B0B0), spreadRadius: 0, blurRadius: 4),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                child: BottomNavigationBar(
                  backgroundColor: Colors.white,
                  onTap: (int index) {
                    setState(() {
                      selectedIndexGlobalPharmacy.value = index;
                    });
                  },
                  currentIndex: selectedIndexGlobal.value,
                  selectedItemColor: const Color(0xff04726E),
                  unselectedItemColor: const Color(0xffA5A5A5),
                  showUnselectedLabels: true,
                  type: BottomNavigationBarType.fixed,
                  selectedLabelStyle: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      textStyle: const TextStyle(
                          overflow: TextOverflow.visible
                      )
                  ),
                  unselectedLabelStyle: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      textStyle: const TextStyle(
                          overflow: TextOverflow.visible
                      )
                  ),
                  iconSize: 20,
                  elevation: 0,
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: SizedBox(height: 24, child: Icon(Iconsax.home)),
                        label: 'Home'
                    ),
                    BottomNavigationBarItem(
                        icon: SizedBox(height: 24, child: Icon(Iconsax.profile_circle)),
                        label: 'Profile'
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
