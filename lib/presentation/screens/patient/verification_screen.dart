import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_prescription/presentation/pages/patient/auth_page.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Verification"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Text("Enter Verification Code",
              textAlign: TextAlign.start,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w700,
                fontSize: 18
              ),
            ),
            const SizedBox(height: 30 ,),
            const Text("Enter code that we have sent to your number 08528188*** "),
            const SizedBox(height: 30,),
            Form(child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 68,
                  width: 64,
                  child: TextFormField(
                    autofocus: true,
                    onChanged: (value){
                      if(value.length == 1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w800,
                      fontSize: 20,
                      height: 1.3
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xff069893))),
                      filled: true,
                      fillColor: const Color(0xffEDEDED),
                      focusColor: Colors.white
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                SizedBox(
                  height: 68,
                  width: 64,
                  child: TextFormField(
                    onChanged: (value){
                      if(value.length == 1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        height: 1.3
                    ),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xff069893))),
                        filled: true,
                        fillColor: const Color(0xffEDEDED),
                        focusColor: Colors.white
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                SizedBox(
                  height: 68,
                  width: 64,
                  child: TextFormField(
                    onChanged: (value){
                      if(value.length == 1){
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        height: 1.3
                    ),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xff069893))),
                        filled: true,
                        fillColor: const Color(0xffEDEDED),
                        focusColor: Colors.white
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                ),
                SizedBox(
                  height: 68,
                  width: 64,
                  child: TextFormField(
                    onChanged: (value){
                      if(value.length == 1){
                        FocusScope.of(context).nextFocus();
                        authPageIndex.value=4;
                      }
                    },
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                        height: 1.3
                    ),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xff069893))),
                        filled: true,
                        fillColor: const Color(0xffEDEDED),
                        focusColor: Colors.white
                    ),
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                  ),
                )
              ],
            )),
            const SizedBox(height: 30,),
            const Text("Resend code after 35 sec."),
            const SizedBox(height: 70,),
            SizedBox(
              width: 330,
              height: 54,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(Color(0xffE5E5E5)),
                      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                      elevation: const MaterialStatePropertyAll(0),
                      foregroundColor: const MaterialStatePropertyAll(Colors.black),
                      shadowColor: const MaterialStatePropertyAll(Colors.transparent),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
                  ),
                  onPressed: (){},
                  child: Text(
                    "Get new Code",
                    style: GoogleFonts.montserrat(fontSize:18, fontWeight: FontWeight.w400),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
