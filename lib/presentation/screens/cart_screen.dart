import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/presentation/screens/map_screen.dart';
import 'package:medical_prescription/presentation/widgets/cart_page_item.dart';

import '../bloc/cart_bloc/cart_bloc.dart';



class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartBloc cartBloc;
  
  @override
  void initState() {
    cartBloc = context.read<CartBloc>();
    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
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
            color: state.cartItems.isEmpty? Colors.white : const Color(0xffF0F0F0),
            child: state.cartItems.isEmpty ? 
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/EmptyStatecie.png"),
                    const Text(
                      "Cart is empty",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
              ) : 
                   ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (BuildContext context, int index){
                      return CartPageItem(cartItemEntity: state.cartItems.elementAt(index),);
                    },
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15,),
                    itemCount: state.cartItems.length,
                  )
          ),
          persistentFooterButtons: state.cartItems.isNotEmpty? [
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
                        onPressed: (){
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) => MapScreen(),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ),
                          );
                        },
                        style: ButtonStyle(
                          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                          foregroundColor: const MaterialStatePropertyAll(Colors.black),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
                          backgroundColor: const MaterialStatePropertyAll(Color(0xff199A8E)),
                          padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 14, horizontal: 15))
                        ),
                        child: Text("Take from pharmacy", style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14))
                      )
                    ],
                ),
              ),
            )
          ] : []
        );
      }
    );
  }
}
