import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/presentation/components/phone_number_formatter.dart';
import 'package:medical_prescription/presentation/pages/patient/auth_page.dart';

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
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){
              setState(() {
                authPageIndex.value=0;
              });
            },
            icon: const Icon(Iconsax.arrow_left)
        ),
        title: Text("Sign Up", style: GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: 16),),
        centerTitle: true,
      ),
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
                margin: const EdgeInsets.symmetric(horizontal: 30),
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
            const SizedBox(height: 40,),
            const SizedBox(
              width: 300,
              child: Text("By clicking 'Send Code', I accept Terms of Service and Privacy Policy",
                textAlign: TextAlign.center,
              )),
            const SizedBox(height: 20,),
            SizedBox(
              width: 330,
              height: 54,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: const MaterialStatePropertyAll(Color(0xff199A8E)),
                      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                      elevation: const MaterialStatePropertyAll(0),
                      foregroundColor: const MaterialStatePropertyAll(Colors.white),
                      shadowColor: const MaterialStatePropertyAll(Colors.transparent),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
                  ),
                  onPressed: (){
                    setState(() {
                      authPageIndex.value=3;
                    });
                  },
                  child: Text(
                    "Send code",
                    style: GoogleFonts.montserrat(fontSize:16, fontWeight: FontWeight.w400),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
