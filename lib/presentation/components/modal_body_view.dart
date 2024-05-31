import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/presentation/screens/patient/checkout_screen.dart';

import '../../domain/entities/mapPoint.dart';

class ModalBodyView extends StatefulWidget {
  const ModalBodyView({super.key, required this.point});
  final MapPoint point;

  @override
  State<ModalBodyView> createState() => _ModalBodyViewState();
}

class _ModalBodyViewState extends State<ModalBodyView> {
  bool reveal = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: reveal? 225+87.5*2 : 235,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              color: Colors.white,
            ),
            padding: const EdgeInsets.only(right: 20, left: 20, top:30, bottom: 15),
            child: Stack(
              children: [
                Positioned(
                  right: -14,
                  top: -14,
                  child: IconButton(
                      onPressed: (){Navigator.of(context).pop();},
                      icon: const Icon(Iconsax.close_circle)
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: const Color(0xffCDCDCD), width: 2)
                          ),
                          padding: const EdgeInsets.all(7),
                          width: 60,
                          height: 60,
                          child: Image.asset("assets/icons/map_point.png")
                        ),
                        const SizedBox(width: 20,),
                        Text("EuroPharma",
                          style: GoogleFonts.montserrat(
                            fontSize: 18,
                            fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 5,),
                    Text(
                      "Астана, ул.Тарас-Шевченко, 3",
                      style: GoogleFonts.montserrat(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xffB0B0B0),
                      ),
                    ),
                    const SizedBox(height: 5,),
                    const Text(
                      "Побудням 9:00-21:00"
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: (){
                          setState(() {
                            reveal = !reveal;
                          });
                        },
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(0)
                          )),
                          surfaceTintColor: const MaterialStatePropertyAll(Colors.black),
                          foregroundColor: const MaterialStatePropertyAll(Color(0xff13665F)),
                          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                        ),
                        child: Row(
                          children: [
                            RotatedBox(quarterTurns: reveal? 1 : 0,
                            child: const Icon(Icons.arrow_forward_ios, size: 16,)),
                            const SizedBox(width: 5,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("480₸",
                                  style: GoogleFonts.montserrat(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w700
                                  ),
                                ),
                                Text("Все в наличии",
                                  style: GoogleFonts.montserrat(
                                    color: const Color(0xff177500),
                                    fontWeight: FontWeight.w600
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).push(CupertinoPageRoute(builder: (context)=> CheckoutScreen()));
                        },
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)
                          )),
                          surfaceTintColor: const MaterialStatePropertyAll(Colors.black),
                          backgroundColor: const MaterialStatePropertyAll(Color(0xff199A8E)),
                          foregroundColor: const MaterialStatePropertyAll(Colors.white),
                          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                          textStyle: MaterialStatePropertyAll(GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14)),
                        ),
                        child: const Text("Забрать в аптеке"),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  reveal ?
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      height: 130,
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index){
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.network("https://st.europharma.kz/cache/product/2135/x248_5f6874ea35695.png", height: 50,),
                                  const SizedBox(width: 10,),
                                  const Text("Ношпа"),
                                ],
                              ),
                              Text("480₸",
                                style: GoogleFonts.montserrat(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w700,
                                  color: const Color(0xff13665F)
                                ),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) => const Divider(),
                        itemCount: 1
                      )
                    ) : Container()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}