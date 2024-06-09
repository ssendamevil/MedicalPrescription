import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_prescription/presentation/pages/patient/auth_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/logos/app-logo.png", height: 100,),
            const SizedBox(height: 40,),
            Text(
              AppLocalizations.of(context)!.login_greating_title,
              style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w700
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Align(
                child: Text(
                  AppLocalizations.of(context)!.login_greating_desc,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 16,
                    color: const Color(0xff717784)
                  ),
                ),
              )
            ),
            const SizedBox(height: 65,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
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
                    authPageIndex.value=1;
                  });
                },
                child: Text(
                  AppLocalizations.of(context)!.login_btn,
                  style: GoogleFonts.montserrat(fontSize:16, fontWeight: FontWeight.w500),
                )
              ),
            ),
            const SizedBox(height: 15,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 54,
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
                    elevation: const MaterialStatePropertyAll(0),
                    overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                    foregroundColor: const MaterialStatePropertyAll(Color(0xff04726E)),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                    shadowColor: const MaterialStatePropertyAll(Colors.transparent),
                    side: const MaterialStatePropertyAll(BorderSide(color: Color(0xff069893), width: 3))
                ),
                onPressed: (){
                  authPageIndex.value=2;
                },
                child: Text(
                  AppLocalizations.of(context)!.sign_up_btn,
                  style: GoogleFonts.montserrat(fontSize:16, fontWeight: FontWeight.w500),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
