import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/data/data_sources/local/hive/box_helper.dart';
import 'package:medical_prescription/presentation/screens/patient/map_screen.dart';
import 'package:medical_prescription/presentation/components/cart_page_item.dart';
import 'package:medical_prescription/presentation/widgets/shimmer_box.dart';
import '../../bloc/cart_bloc/cart_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartBloc cartBloc;
  bool isLoading = false;
  
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
              "Cart",
            ),
            centerTitle: true,
          ),
          body: isLoading ?
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(0xffF0F0F0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          ShimmerBox(height: MediaQuery.of(context).size.height, width: 100, borderRadius: 10,),
                          const SizedBox(width: 10,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width-170,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    ShimmerBox(height: 25, width: MediaQuery.of(context).size.width,borderRadius: 0,),
                                    const SizedBox(height: 5,),
                                    ShimmerBox(height: 35, width: MediaQuery.of(context).size.width, borderRadius: 0,),
                                    const SizedBox(height: 5,),
                                    ShimmerBox(height: 25, width: MediaQuery.of(context).size.width, borderRadius: 0,),
                                  ],
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ShimmerBox(height: 30, width: 70, borderRadius: 0),
                                    Row(
                                      children: [
                                        ShimmerBox(height: 40, width: 40, borderRadius: 50),
                                        SizedBox(width: 5,),
                                        ShimmerBox(height: 25, width: 25, borderRadius: 0),
                                        SizedBox(width: 5,),
                                        ShimmerBox(height: 40, width: 40, borderRadius: 50),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(0xffF0F0F0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          ShimmerBox(height: MediaQuery.of(context).size.height, width: 100, borderRadius: 10,),
                          const SizedBox(width: 10,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width-170,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    ShimmerBox(height: 25, width: MediaQuery.of(context).size.width,borderRadius: 0,),
                                    const SizedBox(height: 5,),
                                    ShimmerBox(height: 35, width: MediaQuery.of(context).size.width, borderRadius: 0,),
                                    const SizedBox(height: 5,),
                                    ShimmerBox(height: 25, width: MediaQuery.of(context).size.width, borderRadius: 0,),
                                  ],
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ShimmerBox(height: 30, width: 70, borderRadius: 0),
                                    Row(
                                      children: [
                                        ShimmerBox(height: 40, width: 40, borderRadius: 50),
                                        SizedBox(width: 5,),
                                        ShimmerBox(height: 25, width: 25, borderRadius: 0),
                                        SizedBox(width: 5,),
                                        ShimmerBox(height: 40, width: 40, borderRadius: 50),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(0xffF0F0F0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        children: [
                          ShimmerBox(height: MediaQuery.of(context).size.height, width: 100, borderRadius: 10,),
                          const SizedBox(width: 10,),
                          SizedBox(
                            width: MediaQuery.of(context).size.width-170,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    ShimmerBox(height: 25, width: MediaQuery.of(context).size.width,borderRadius: 0,),
                                    const SizedBox(height: 5,),
                                    ShimmerBox(height: 35, width: MediaQuery.of(context).size.width, borderRadius: 0,),
                                    const SizedBox(height: 5,),
                                    ShimmerBox(height: 25, width: MediaQuery.of(context).size.width, borderRadius: 0,),
                                  ],
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    ShimmerBox(height: 30, width: 70, borderRadius: 0),
                                    Row(
                                      children: [
                                        ShimmerBox(height: 40, width: 40, borderRadius: 50),
                                        SizedBox(width: 5,),
                                        ShimmerBox(height: 25, width: 25, borderRadius: 0),
                                        SizedBox(width: 5,),
                                        ShimmerBox(height: 40, width: 40, borderRadius: 50),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            color: BoxHelper.getCart()!.isEmpty? Colors.white : const Color(0xffF0F0F0),
            child: BoxHelper.getCart()!.isEmpty ?
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
                      return CartPageItem(cartItemEntity: BoxHelper.getCart()!.elementAt(index));
                    },
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15,),
                    itemCount: BoxHelper.getCart()!.length,
                  )
          ),
          bottomNavigationBar: BoxHelper.getCart()!.isNotEmpty ?
            Container(
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Color(0xffE7E7E7), width: 2)),
              ),
              height: 87,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
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
                            pageBuilder: (context, animation1, animation2) => const MapScreen(),
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
            )
          : null
        );
      }
    );
  }
}
