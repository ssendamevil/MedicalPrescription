import 'package:flutter/material.dart';
import 'package:medical_prescription/presentation/screens/pharmacy/home_screen.dart';
import 'package:medical_prescription/presentation/screens/pharmacy/prescription_screen.dart';
import 'package:medical_prescription/presentation/screens/pharmacy/qr_scanner_screen.dart';

final ValueNotifier pharmacyHomePageIndex = ValueNotifier(0);

class PharmacyHomePage extends StatelessWidget {
  PharmacyHomePage({Key? key}) : super(key: key);

  final List<Widget> screens = [
    const HomeScreen(),
    const QRScannerScreen(),
    const PrescriptionScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: pharmacyHomePageIndex,
      builder: (context, val, child){
        return screens.elementAt(pharmacyHomePageIndex.value);
      }
    );
  }
}
