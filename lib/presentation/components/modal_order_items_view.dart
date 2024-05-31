import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

class ModalOrderItemsView extends StatefulWidget {
  const ModalOrderItemsView({Key? key}) : super(key: key);

  @override
  State<ModalOrderItemsView> createState() => _ModalOrderItemsViewState();
}

class _ModalOrderItemsViewState extends State<ModalOrderItemsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 55,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Stack(
              children: [
                Center(
                  child: Text("Состав заказа",
                    style: GoogleFonts.montserrat(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 3,
                  child: IconButton(
                      onPressed: (){Navigator.of(context).pop();},
                      icon: const Icon(Iconsax.close_circle)
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("1 Товар".toUpperCase(),
                  style: GoogleFonts.montserrat(
                    fontSize: 16.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.82,
                  child: ListView.separated(
                    itemBuilder: (BuildContext context, int index){
                      return Container(
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                          border: Border.all(width: 1.0, color: const Color(0xffD7D7D7)),
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(3, 3),
                              blurRadius: 8,
                              color: Color(0xffE7E7E7)
                            ),
                            BoxShadow(
                              offset: Offset(-2, 3),
                              blurRadius: 8,
                              color: Color(0xffE7E7E7)
                            )
                          ]
                        ),
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Image.network("https://st.europharma.kz/cache/product/2135/x248_5f6874ea35695.png", height: 70,)
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Но-шпа", style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0
                                  ),),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Таблетки 10мг+40 мг/г, 17г",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 16.0
                                        ),
                                      ),
                                      Text("Aстана",
                                        style: GoogleFonts.montserrat(
                                          fontSize: 14.0,
                                          color: Colors.grey
                                        ),
                                      )
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("480₸", style: GoogleFonts.montserrat(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xff13665F)
                                      ),),
                                      Text("1 шт.",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 20,),
                    itemCount: 1
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
