import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_prescription/presentation/screens/sign_up_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/medics_logo.png"),
          const SizedBox(height: 40,),
          Text("Let’s get started!",
            style: GoogleFonts.montserrat(
                fontSize: 20,
                fontWeight: FontWeight.w700
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Align(
              child: Text("Login to enjoy the features we’ve provided, and stay healthy!",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontSize: 20,
                  color: const Color(0xff717784)
                ),
              ),
            )
          ),
          const SizedBox(height: 65,),
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
              onPressed: (){},
              child: Text(
                "Login",
                style: GoogleFonts.montserrat(fontSize:16, fontWeight: FontWeight.w500),
              )
            ),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            width: 330,
            height: 54,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
                  elevation: const MaterialStatePropertyAll(0),
                  overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                  foregroundColor: const MaterialStatePropertyAll(Color(0xff04726E)),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                  shadowColor: const MaterialStatePropertyAll(Colors.transparent),
                  side: const MaterialStatePropertyAll(BorderSide(color: Color(0xff069893), width: 2))
              ),
              onPressed: (){
                Navigator.push(context, CupertinoPageRoute(builder: (context) => SignUpScreen()));
              },
              child: Text(
                "Sign Up",
                style: GoogleFonts.montserrat(fontSize:16, fontWeight: FontWeight.w500),
              )
            ),
          )
        ],
      ),
    );
  }
}
