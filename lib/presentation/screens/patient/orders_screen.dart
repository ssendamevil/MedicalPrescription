import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/core/util/theme/Colors.dart';
import 'package:medical_prescription/presentation/components/order_screen_item.dart';
import 'package:medical_prescription/presentation/pages/patient/profile_page.dart';
import 'package:medical_prescription/presentation/widgets/shimmer_box.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  bool isLoading = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F0F0),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
            onPressed: (){
              profilePageIndex.value = 0;
            },
            icon: const Icon(Iconsax.arrow_left)
        ),
        title: const Text(
          "Заказы",
        ),
        centerTitle: true,
        shape: Border(
            bottom: BorderSide(color: customBlack.shade100, width: 1)
        ),
      ),
      body: isLoading?
      Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
            decoration: const BoxDecoration(
              color: Colors.white
            ),
            child: Column(
              children: [
                ShimmerBox(height: 25, width: MediaQuery.of(context).size.width, borderRadius: 0),
                const SizedBox(height: 10,),
                ShimmerBox(height: 25, width: MediaQuery.of(context).size.width, borderRadius: 0),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 25),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ShimmerBox(height: 25, width: 150, borderRadius: 0),
                          ShimmerBox(height: 25, width: 150, borderRadius: 0),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ShimmerBox(height: 25, width: 110, borderRadius: 0),
                          ShimmerBox(height: 25, width: 70, borderRadius: 0),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      ShimmerBox(height: 60, width: MediaQuery.of(context).size.width, borderRadius: 10)
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ShimmerBox(height: 25, width: 150, borderRadius: 0),
                          ShimmerBox(height: 25, width: 150, borderRadius: 0),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ShimmerBox(height: 25, width: 110, borderRadius: 0),
                          ShimmerBox(height: 25, width: 70, borderRadius: 0),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      ShimmerBox(height: 60, width: MediaQuery.of(context).size.width, borderRadius: 10)
                    ],
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Column(
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ShimmerBox(height: 25, width: 150, borderRadius: 0),
                          ShimmerBox(height: 25, width: 150, borderRadius: 0),
                        ],
                      ),
                      const SizedBox(height: 5,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ShimmerBox(height: 25, width: 110, borderRadius: 0),
                          ShimmerBox(height: 25, width: 70, borderRadius: 0),
                        ],
                      ),
                      const SizedBox(height: 10,),
                      ShimmerBox(height: 60, width: MediaQuery.of(context).size.width, borderRadius: 10)
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      )
      : Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white
            ),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Показать', style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w600),),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: const MaterialStatePropertyAll(Color(0xff13665F)),
                    textStyle: MaterialStatePropertyAll(GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    )),
                    shadowColor: const MaterialStatePropertyAll(Colors.transparent),
                    surfaceTintColor: const MaterialStatePropertyAll(Colors.transparent),
                    padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 0, vertical: 10)),
                    overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                    shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    )),
                  ),
                  onPressed: (){}, 
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Все"),
                      Icon(Icons.arrow_forward_ios, size: 15,)
                    ],
                  )
                ),
              ],
            ),
          ),
          const SizedBox(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                children: [
                  OrderScreenItem()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
