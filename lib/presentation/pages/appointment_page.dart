import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_prescription/presentation/screens/prescription_screen.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          "Treatment Scheme",
          style: GoogleFonts.nunitoSans(
              fontSize: 18.0,
              fontWeight: FontWeight.w900
          ),
        ),
        backgroundColor: const Color(0xff07BEB8),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ClipPath(
            clipper: BottomCurveClipper(),
            child: Container(
              height: 140.0,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xff07BEB8),
            ),
          ),

          Expanded(
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return OutlinedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        CupertinoPageRoute(builder: (context) => const PrescriptionScreen()),
                      );
                    },
                    style: ButtonStyle(
                      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 20, horizontal: 20))
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Prescription №123456789",
                            style: GoogleFonts.montserrat(
                              textStyle: Theme.of(context).textTheme.bodySmall,
                              color: Colors.grey
                            ),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "Amikacin, 400mg",
                            style: Theme.of(context).textTheme.headlineSmall
                          ),
                          SizedBox(height: 10,),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(5)
                            ),
                            child: Text(
                              "The validity period expires in 10 days",
                              style: GoogleFonts.montserrat(
                                textStyle: Theme.of(context).textTheme.labelMedium,
                                color: Colors.white
                              ),
                            ),
                          ),
                          SizedBox(height: 20,),
                          Text(
                            "Best price",
                            style: GoogleFonts.montserrat(
                                textStyle: Theme.of(context).textTheme.bodySmall,
                                color: Colors.grey
                            ),
                          ),
                          Text(
                            "1890₸",
                            style: GoogleFonts.montserrat(
                              textStyle: Theme.of(context).textTheme.headlineSmall
                            )
                          ),
                          SizedBox(height: 20,),
                          Text(
                            "Recomendations",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "5 products available",
                            style: GoogleFonts.montserrat(
                                textStyle: Theme.of(context).textTheme.bodySmall,
                                color: Colors.grey
                            ),
                          ),
                        ],
                      ),
                    )
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const Divider(
                  height: 20,
                  color: Colors.transparent,
                ),
                itemCount: 10
              )
            ),
          ),
        ],
      )
    );
  }

}

class BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);

    final firstCurve = Offset(0, size.height - 30);
    final lastCurve = Offset(35, size.height - 30);
    path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);

    final secondfirstCurve = Offset(0, size.height - 30);
    final secondlastCurve = Offset(size.width-35, size.height - 30);
    path.quadraticBezierTo(secondfirstCurve.dx, secondfirstCurve.dy, secondlastCurve.dx, secondlastCurve.dy);

    final thirdfirstCurve = Offset(size.width, size.height - 30);
    final thirdlastCurve = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdfirstCurve.dx, thirdfirstCurve.dy, thirdlastCurve.dx, thirdlastCurve.dy);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

