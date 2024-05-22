import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/presentation/app.dart';
import 'package:medical_prescription/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:medical_prescription/presentation/components/instruction_item.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../core/util/theme/Colors.dart';
import '../../domain/entities/cartItem.dart';
import '../../domain/entities/medicament.dart';

class MedicamentScreen extends StatefulWidget {
  const MedicamentScreen({Key? key}) : super(key: key);

  @override
  State<MedicamentScreen> createState() => _MedicamentScreenState();
}

class _MedicamentScreenState extends State<MedicamentScreen> {
  int photoCurrentIndex = 0;
  late CartBloc cartBloc;
  CartItemEntity cartItemEntity = CartItemEntity("1234", MedicamentEntity("name", "price", "country", "company", 1), 1);


  @override
  void initState() {
    cartBloc = context.read<CartBloc>();
    super.initState();
  }
  
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
          "Товар",
        ),
        centerTitle: true,
        shape: Border(
            bottom: BorderSide(color: customBlack.shade100, width: 1)
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: [1,2,3,4,5].map((i) {
                return Builder(
                  builder: (BuildContext context){
                    return Image.network("https://st.europharma.kz/cache/product/2135/x248_5f6874ea35695.png");
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 200,
                  viewportFraction: 1,
                  onPageChanged: (index, reason){
                    setState((){
                      photoCurrentIndex = index;
                    });
                  }
              )
            ),
            const SizedBox(height: 50,),
            AnimatedSmoothIndicator(
              activeIndex: photoCurrentIndex,
              count: 5,
              effect: const WormEffect(
                  dotHeight: 7,
                  dotWidth: 7,
                  dotColor: Color(0xffD9D9D9),
                  activeDotColor: Colors.black
              ),
            ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Но-шпа",
                      style: GoogleFonts.montserrat(fontSize: 18.0, fontWeight: FontWeight.w700),
                    ),
                  ),
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
                  Text("Капли назальные".toUpperCase(),
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,

                    ),
                  ),
                  const SizedBox(height: 20,),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Действующие вещества",
                      style: GoogleFonts.montserrat(fontSize: 16.0, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: const Color(0xff0C7E74)
                          ),
                        ),
                        height: 26,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "Пасиреотид",
                          style: GoogleFonts.montserrat(
                              color: const Color(0xff13665F),
                              fontSize: 15,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: const Color(0xff0C7E74)
                          ),
                        ),
                        height: 26,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          "Окситоцин",
                          style: GoogleFonts.montserrat(
                              color: const Color(0xff13665F),
                              fontSize: 15,
                              fontWeight: FontWeight.w600
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Страна",
                        style: GoogleFonts.montserrat(fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "Russia",
                        style: GoogleFonts.montserrat(fontSize: 16.0, fontWeight: FontWeight.w600, color: const Color(0xff606A69)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Доза",
                        style: GoogleFonts.montserrat(fontSize: 16.0, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "0.25mg+2.5mg/ml, 15 ml",
                        style: GoogleFonts.montserrat(fontSize: 16.0, fontWeight: FontWeight.w600, color: const Color(0xff606A69)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25,),
                  Text(
                    "Инструкция",
                    style: GoogleFonts.montserrat(fontSize: 18.0, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 20,),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index){
                        return const InstructionItem();
                      },
                      separatorBuilder: (BuildContext context, int index) => const Divider(),
                      itemCount: 5
                    ),
                  )

                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 50,
                  width: MediaQuery.of(context).size.width*0.4,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("от 1890₸",
                      style: GoogleFonts.montserrat(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  )
                ),
                const SizedBox(width: 5,),
                state.cartItems.contains(cartItemEntity) ?
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.5,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){
                      state.cartItems.contains(cartItemEntity)? null : cartBloc.add(AddMedicamentToCartEvent(cartItemEntity));
                    },
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                      backgroundColor: const MaterialStatePropertyAll(Color(0xff199A8E)),
                      foregroundColor: const MaterialStatePropertyAll(Colors.white),
                      textStyle: MaterialStatePropertyAll(
                        GoogleFonts.montserrat(fontSize: 16.0)
                      )
                    ),
                    child: const Text("В корзину"),
                  ),
                ) :
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.5,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: (){
                      selectedIndexGlobal.value = 3;
                      Navigator.of(context).pop();
                    },
                    style: ButtonStyle(
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                        side: const MaterialStatePropertyAll(BorderSide(
                          color: Color(0xff199A8E),
                          width: 2
                        )),
                        padding: const MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 0)),
                        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                        foregroundColor: const MaterialStatePropertyAll(Color(0xff199A8E)),
                        textStyle: MaterialStatePropertyAll(
                            GoogleFonts.montserrat(fontSize: 16.0, fontWeight: FontWeight.w600)
                        )
                    ),
                    child: const Text("Перейти в корзину"),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
