import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_prescription/presentation/screens/patient/sign_up_screen.dart';

class RoleScreen extends StatefulWidget {
  const RoleScreen({Key? key}) : super(key: key);

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Выберите, кем вы являетесь:",
              style: GoogleFonts.montserrat(
                fontSize: 16.0,
                color: const Color(0xff2F2F2F)
              ),
            ),
            const SizedBox(height: 20,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff13665F),
                    Color(0xff199A8E)
                  ],
                  tileMode: TileMode.mirror,
                ),
                borderRadius: BorderRadius.circular(15)
              ),
              child: ElevatedButton(
                onPressed: (){
                  Navigator.of(context).push(CupertinoPageRoute(builder: (context)=> const SignUpScreen()));
                },
                style: ButtonStyle(
                  foregroundColor: const MaterialStatePropertyAll(Colors.white),
                  overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                  shadowColor: const MaterialStatePropertyAll(Colors.transparent),
                  backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
                  surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  )),
                  textStyle: MaterialStatePropertyAll(
                    GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700,
                      fontSize: 20.0
                    )
                  )
                ),
                child: const Text(
                  "Я - пациент"
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color(0xff13665F),
                      Color(0xff199A8E)
                    ],
                    tileMode: TileMode.mirror,
                  ),
                  borderRadius: BorderRadius.circular(15)
              ),
              child: ElevatedButton(
                onPressed: (){},
                style: ButtonStyle(
                    foregroundColor: const MaterialStatePropertyAll(Colors.white),
                    overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                    shadowColor: const MaterialStatePropertyAll(Colors.transparent),
                    backgroundColor: const MaterialStatePropertyAll(Colors.transparent),
                    surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    )),
                    textStyle: MaterialStatePropertyAll(
                        GoogleFonts.montserrat(
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0
                        )
                    )
                ),
                child: const Text(
                    "Я - фармацевт"
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
