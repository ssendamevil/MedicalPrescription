import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/presentation/widgets/cart_page_item.dart';



class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const Border(
          bottom: BorderSide(
            color: Color(0xffD9D9D9)
          )
        ),
        scrolledUnderElevation: 0,
        title: const Text(
          "Cart"
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: MediaQuery.of(context).size.width,
        color: const Color(0xffF0F0F0),
        child: ListView(
          children: const [
            SizedBox(height: 15,),
            CartPageItem(),
            SizedBox(height: 15,),
            CartPageItem(),
            SizedBox(height: 15,),
            CartPageItem(),
            SizedBox(height: 15,),
            CartPageItem(),
            SizedBox(height: 10,),
          ],
        ),
      ),
      persistentFooterButtons: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          const Icon(Iconsax.bag, size: 22, color: Color(0xff04726E)),
                          const SizedBox(width: 5,),
                          Text("Pick Up", style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 15))
                        ],
                      ),
                      const SizedBox(height: 10,),
                      Text("from 2110₸", style: GoogleFonts.montserrat(color: const Color(0xff04726E), fontWeight: FontWeight.w700, fontSize: 15))
                    ],
                  ),
                  ElevatedButton(
                    onPressed: (){},
                    style: ButtonStyle(
                      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                      foregroundColor: const MaterialStatePropertyAll(Colors.black),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
                      backgroundColor: const MaterialStatePropertyAll(Color(0xff39CBC6)),
                      padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 14, horizontal: 15))
                    ),
                    child: Text("Take from pharmacy", style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14))
                  )
                ],
            ),
          ),
        )
      ],
    );
  }
}
