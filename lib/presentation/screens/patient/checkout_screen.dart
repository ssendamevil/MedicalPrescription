import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/presentation/components/modal_order_items_view.dart';
import 'package:medical_prescription/presentation/pages/patient/cart_page.dart';
import 'package:medical_prescription/presentation/pages/patient/search_page.dart';
import 'package:medical_prescription/presentation/screens/patient/order_screen.dart';

import '../../../core/util/theme/Colors.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            icon: const Icon(Iconsax.arrow_left)
        ),
        title: const Text(
          "Оформление товара",
        ),
        centerTitle: true,
        shape: Border(
            bottom: BorderSide(color: customBlack.shade100, width: 1)
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: const Color(0xffF0F0F0),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1.0, color: const Color(0xffD7D7D7)),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        offset: Offset(3, 3),
                        blurRadius: 5,
                        color: Color(0xffe1e1e1)
                    ),
                    BoxShadow(
                        offset: Offset(-2, 3),
                        blurRadius: 5,
                        color: Color(0xffE1E1E1)
                    )
                  ]
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Самовывоз из аптеки", style: GoogleFonts.montserrat(fontSize: 16.0, fontWeight: FontWeight.w600),),
                    const SizedBox(height: 5,),
                    Text("Бесплатно", style: GoogleFonts.montserrat(fontSize: 14.0, color: const Color(0xffa1a1a1)),),
                    const SizedBox(height: 20,),
                    const Divider(color: Color(0xffD7D7D7),),
                    const SizedBox(height: 10,),
                    Text("Аптека:", style: GoogleFonts.montserrat(fontSize: 16.0, fontWeight: FontWeight.w600),),
                    const SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Europharma", style: GoogleFonts.montserrat(fontSize: 16.0)),
                        SizedBox(
                            width: 45,
                            height: 45,
                            child: Image.asset("assets/icons/map_point.png")
                        ),
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
                            fontSize: 14.0
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
                              fontSize: 14.0
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10,)
                  ],
                ),
              ),
              const SizedBox(height: 25,),
              Text("Способы оплаты", style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.w600
                ),
              ),
              const SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1.0, color: const Color(0xffD7D7D7)),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(3, 3),
                          blurRadius: 5,
                          color: Color(0xffe1e1e1)
                      ),
                      BoxShadow(
                          offset: Offset(-2, 3),
                          blurRadius: 5,
                          color: Color(0xffE1E1E1)
                      )
                    ]
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Наличными или банковской картой при получении", style: GoogleFonts.montserrat(fontSize: 16.0, fontWeight: FontWeight.w600),),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1.0, color: const Color(0xffD7D7D7)),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(3, 3),
                          blurRadius: 5,
                          color: Color(0xffe1e1e1)
                      ),
                      BoxShadow(
                          offset: Offset(-2, 3),
                          blurRadius: 5,
                          color: Color(0xffE1E1E1)
                      )
                    ]
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Состав заказа", style: GoogleFonts.montserrat(fontSize: 16.0, fontWeight: FontWeight.w600),),
                            Text("1 товар", style: GoogleFonts.montserrat(fontSize: 14.0, color: Colors.grey),)
                          ],
                        ),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width*0.45,
                          child: ElevatedButton(
                            onPressed: () => showModalBottomSheet(
                                isScrollControlled: true,
                                useSafeArea: true,
                                context: context,
                                builder: (context) => const ModalOrderItemsView()
                            ),
                            style: ButtonStyle(
                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
                              )),
                              surfaceTintColor: const MaterialStatePropertyAll(Colors.black),
                              backgroundColor: const MaterialStatePropertyAll(Color(0xff199A8E)),
                              foregroundColor: const MaterialStatePropertyAll(Colors.white),
                              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                              textStyle: MaterialStatePropertyAll(GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16)),
                            ),
                            child: const Text("Посмотреть"),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(height: 35,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Сумма заказа",
                    style: GoogleFonts.montserrat(
                      fontSize: 19.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  Text("480₸",
                    style: GoogleFonts.montserrat(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xff13665F)
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color(0xffF0F0F0),
        padding: const EdgeInsets.all(15),
        child: SizedBox(
          height: 55,
          child: ElevatedButton(
            onPressed: () {
              // Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const OrderScreen()));
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              Navigator.of(context).pop();
              cartPageIndex.value = 1;
            },
            style: ButtonStyle(
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              )),
              surfaceTintColor: const MaterialStatePropertyAll(Colors.black),
              backgroundColor: const MaterialStatePropertyAll(Color(0xff3D9F95)),
              foregroundColor: const MaterialStatePropertyAll(Colors.white),
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
              textStyle: MaterialStatePropertyAll(GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 18)),
            ),
            child: const Text("Оформить"),
          ),
        ),
      ),
    );
  }
}
