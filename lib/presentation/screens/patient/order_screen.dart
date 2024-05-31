import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/presentation/pages/patient/cart_page.dart';
import '../../../core/util/theme/Colors.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F0F0),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
            onPressed: (){
              cartPageIndex.value = 0;
            },
            icon: const Icon(Iconsax.arrow_left)
        ),
        title: const Text(
          "Заказ №954",
        ),
        centerTitle: true,
        shape: Border(
            bottom: BorderSide(color: customBlack.shade100, width: 1)
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 5,),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: const Color(0xffD7D7D7)),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xffA8FF92),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Text(
                      "Заказ принят",
                      style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff177500)
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    child: Text(
                      "Срок хранения заказа 48 часов",
                      style: GoogleFonts.montserrat(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Самовывоз из', style: GoogleFonts.montserrat(fontSize: 18.0, fontWeight: FontWeight.w600),),
                          Text("EuroPharma", style: GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: 16.0 ),)
                        ],
                      ),
                      SizedBox(
                          width: 45,
                          height: 45,
                          child: Image.asset("assets/icons/map_point.png")
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Row(
                    children: [
                      Icon(Iconsax.warning_2, size: 16,color: Colors.orange,),
                      SizedBox(width: 5,),
                      Text(
                        "On Prescription",
                        style: TextStyle(
                            color: Colors.orange
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Iconsax.clock,size: 18,),
                      const SizedBox(width: 5,),
                      Text("Еженедельно",
                        style: GoogleFonts.montserrat(
                            fontSize: 16.0
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Iconsax.location,size: 18,),
                      const SizedBox(width: 5,),
                      Text("Астана, Тараса-Шевченко, 1",
                        style: GoogleFonts.montserrat(
                            fontSize: 16.0
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1.0, color: const Color(0xffD7D7D7)),
                color: Colors.white,
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Товары в заказе", style: GoogleFonts.montserrat(fontSize: 18.0, fontWeight: FontWeight.w600),),
                  const Text("1 товар"),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: 200,
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
                      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 5,),
                      itemCount: 1
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Text("Ваш заказ", style: GoogleFonts.montserrat(fontSize: 20.0, fontWeight: FontWeight.w600),),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Товары (1шт)", style: GoogleFonts.montserrat(fontSize: 16.0),),
                      Text("480₸", style: GoogleFonts.montserrat(fontSize: 16.0, fontWeight: FontWeight.w600),)
                    ],
                  ),
                  const SizedBox(height: 15,),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: DottedDecoration(
                      strokeWidth: 1.5
                    )
                  ),
                  const SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Итого", style: GoogleFonts.montserrat(fontSize: 16.0, fontWeight: FontWeight.w600),),
                      Text("480₸", style: GoogleFonts.montserrat(fontSize: 16.0, fontWeight: FontWeight.w600),)
                    ],
                  ),
                  const SizedBox(height: 15,),
                  TextButton(
                    onPressed: (){},
                    style: ButtonStyle(
                      foregroundColor: const MaterialStatePropertyAll(Colors.red),
                      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                      surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
                      textStyle: MaterialStatePropertyAll(GoogleFonts.montserrat(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600
                      )),
                      padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 0, horizontal: 0))
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(CupertinoIcons.clear_circled),
                        SizedBox(width: 10,),
                        Text("Отменить заказ")
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
