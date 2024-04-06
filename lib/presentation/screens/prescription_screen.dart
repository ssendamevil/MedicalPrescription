import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../pages/appointment_page.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({Key? key}) : super(key: key);

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  final GlobalKey globalKey = GlobalKey();
  String qrData = "SampleData1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Prescription",
          style: Theme.of(context).textTheme.headlineSmall
        ),
        backgroundColor: const Color(0xff07BEB8),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(0.0)),
                ),
                context: context,
                builder: (((context){
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    height: 400,
                    child: Column(
                      children: [
                        Text(
                          "Show it to the pharmacist",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const SizedBox(height: 20,),
                        RepaintBoundary(
                          key: globalKey,
                          child: Center(
                            child: QrImage(
                              data: qrData,
                              version: QrVersions.auto,
                              size: 200,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20,),
                        const Text("№1784554884"),
                        const SizedBox(height: 10,),
                        const Text("2 receipts, 1 available product"),
                      ],
                    ),
                  );
                }))
              );
            },
            icon: const Icon(CupertinoIcons.qrcode, size: 28,color: Colors.black,)
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        children: [
          ClipPath(
            clipper: BottomCurveClipper(),
            child: Container(
              height: 120.0,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xff07BEB8),
              child: Column(
                children: [
                  const Text("№1784554884"),
                  const SizedBox(height: 20,),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    decoration: BoxDecoration(
                        color: Colors.black12,
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
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 270,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xffAAAAAA))
                    ),
                    child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 50,
                              width: double.maxFinite,
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.vertical(top: Radius.circular(20), bottom: Radius.circular(0)),
                              ),
                              child: Text(
                                "Azithromycin",
                                style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    textStyle: Theme.of(context).textTheme.titleLarge
                                ),
                              ),
                            ),
                            Container(
                              width: double.maxFinite,
                              height: constraints.maxHeight-50,
                              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(0), bottom: Radius.circular(20)),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Form",
                                        style: GoogleFonts.montserrat(
                                            textStyle: Theme.of(context).textTheme.bodySmall,
                                            color: Colors.grey
                                        ),
                                      ),
                                      const SizedBox(height: 5,),
                                      Text("Sublingual tablets", style: Theme.of(context).textTheme.titleLarge,),
                                      const SizedBox(height: 20,),
                                      Text("Dosage",
                                        style: GoogleFonts.montserrat(
                                            textStyle: Theme.of(context).textTheme.bodySmall,
                                            color: Colors.grey
                                        ),
                                      ),
                                      const SizedBox(height: 5,),
                                      Text("100 mg", style: Theme.of(context).textTheme.titleLarge,),
                                    ],
                                  ),
                                  Center(child:
                                    SizedBox(
                                      width: 270,
                                      child: ElevatedButton(
                                        onPressed: (){},
                                        style: ButtonStyle(
                                          surfaceTintColor: const MaterialStatePropertyAll<Color>(Colors.black),
                                          shadowColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                                          backgroundColor: const MaterialStatePropertyAll<Color>(Color(0xff07BEB8)),
                                          overlayColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))
                                        ),
                                        child: Text("Buy at 899",
                                          style: GoogleFonts.montserrat(
                                            textStyle: Theme.of(context).textTheme.bodyMedium,
                                            color: Colors.white
                                          ),
                                        )
                                      ),
                                    )
                                  )
                                ],
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 50,),
                  Text("Discharged doctor",
                    style: Theme.of(context).textTheme.headlineSmall
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Berikov Berik Berikulu", style: Theme.of(context).textTheme.titleLarge),
                          Text("Dermatovenerologist", style: GoogleFonts.montserrat(textStyle: Theme.of(context).textTheme.bodyMedium, color: Colors.grey),),
                          Text("Сity polyclinic No. 4", style: GoogleFonts.montserrat(textStyle: Theme.of(context).textTheme.bodyMedium, fontWeight: FontWeight.w600),),
                        ],
                      ),
                      IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.phone_in_talk, color: Colors.grey,size: 25,),
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(EdgeInsets.all(12)),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: const BorderSide(color: Colors.grey, width: 2)
                            )
                          )
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
