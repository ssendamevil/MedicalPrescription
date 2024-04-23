import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_prescription/presentation/components/phone_number_formatter.dart';
import 'package:medical_prescription/presentation/screens/sign_up_form_screen.dart';
import 'package:medical_prescription/presentation/screens/verification_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Enter phone number",
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.w500
              ),
            ),
            const SizedBox(height: 40,),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  autofocus: true,
                  style: GoogleFonts.montserrat(
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                    color: Colors.black
                  ),
                  keyboardType: TextInputType.phone,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: "+7",
                  ),
                  initialValue: "+7",
                  inputFormatters: [
                    PhoneNumberFormatter(sample: "+#-(###)-###-##-##", separator:'-' ),
                    LengthLimitingTextInputFormatter(18)
                  ],
                )
            ),
            SizedBox(height: 80,),
            SizedBox(
              width: 300,
              child: Text("By clicking 'Send Code', I accept Terms of Service and Privacy Policy",
                textAlign: TextAlign.center,
              )),
            SizedBox(height: 20,),
            SizedBox(
              width: 330,
              height: 54,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(Color(0xff07BEB8)),
                      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                      elevation: const MaterialStatePropertyAll(0),
                      foregroundColor: const MaterialStatePropertyAll(Colors.white),
                      shadowColor: const MaterialStatePropertyAll(Colors.transparent),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)))
                  ),
                  onPressed: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => VerificationScreen()));
                  },
                  child: Text(
                    "Send code",
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
