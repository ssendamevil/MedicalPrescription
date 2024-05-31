import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_prescription/presentation/pages/pharmacy/pharmacy_home_page.dart';
import 'package:medical_prescription/presentation/screens/pharmacy/qr_scanner_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Добро пожаловать в DariJaz"
          ),
          shape: const Border(
              bottom: BorderSide(
                  color: Color(0xffD9D9D9)
              )
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              Row(
                children: [
                  ElevatedButton(
                      onPressed: (){
                        pharmacyHomePageIndex.value = 1;
                      },
                    style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(Color(0xff199A8E)),
                      foregroundColor: const MaterialStatePropertyAll(Colors.white),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      )),
                      textStyle: MaterialStatePropertyAll(GoogleFonts.montserrat(
                        fontWeight: FontWeight.w600,
                        fontSize: 16.0
                      ))
                    ),
                      child: const Row(
                        children: [
                          Icon(CupertinoIcons.camera_viewfinder),
                          SizedBox(width: 10,),
                          Text("Scan Prescription")
                        ],
                      ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
