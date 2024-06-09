import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/core/util/theme/Colors.dart';
import 'package:medical_prescription/data/data_sources/local/hive/box_helper.dart';
import 'package:medical_prescription/domain/entities/cart/cart.dart';
import 'package:medical_prescription/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:medical_prescription/presentation/components/instruction_item.dart';
import 'package:medical_prescription/presentation/components/tag_item.dart';
import 'package:medical_prescription/presentation/screens/patient/patient_app.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MedicamentScreen extends StatefulWidget {
  const MedicamentScreen({Key? key, required this.cartEntity}) : super(key: key);
  final CartEntity cartEntity;


  @override
  State<MedicamentScreen> createState() => _MedicamentScreenState();
}

class _MedicamentScreenState extends State<MedicamentScreen> {
  int photoCurrentIndex = 0;
  late CartBloc cartBloc;


  @override
  void initState() {
    cartBloc = context.read<CartBloc>();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF9F9F9),
        appBar: AppBar(
          backgroundColor: const Color(0xff198A8E),
          foregroundColor: Colors.white,
          scrolledUnderElevation: 0,
          leading: IconButton(
              onPressed: (){
                Navigator.of(context).pop();
              },
              icon: const Icon(Iconsax.arrow_left)
          ),
          title: Text(
            AppLocalizations.of(context)!.product_title,
          ),
          centerTitle: true,
          shape: const Border(
              bottom: BorderSide(color: Color(0x13665F), width: 1)
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                decoration: const BoxDecoration(
                  color: Colors.white
                ),
                child: Column(
                  children: [
                    CarouselSlider(
                      items: [1].map((i) {
                        return Builder(
                          builder: (BuildContext context){
                            return Image.network(widget.cartEntity.medicamentEntity.imageUrl);
                          },
                        );
                      }).toList(),
                      options: CarouselOptions(
                          enableInfiniteScroll: false,
                          height: 200,
                          viewportFraction: 1,
                          onPageChanged: (index, reason){
                            setState((){
                              photoCurrentIndex = index;
                            });
                          }
                      )
                  ),
                    const SizedBox(height: 20,),
                    AnimatedSmoothIndicator(
                      activeIndex: photoCurrentIndex,
                      count: 1,
                      effect: const WormEffect(
                          dotHeight: 7,
                          dotWidth: 7,
                          dotColor: Color(0xffD9D9D9),
                          activeDotColor: Colors.black
                      ),
                    ),
                    const SizedBox(height: 20,),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 15,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.cartEntity.medicamentEntity.name,
                        style: GoogleFonts.montserrat(fontSize: 18.0, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        const Icon(Iconsax.warning_2, size: 16,color: Colors.orange,),
                        const SizedBox(width: 5,),
                        Text(
                          AppLocalizations.of(context)!.on_prescription_label,
                          style: const TextStyle(
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
                        AppLocalizations.of(context)!.product_active_ingre,
                        style: GoogleFonts.montserrat(fontSize: 18.0, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        TagItem(tagName: widget.cartEntity.medicamentEntity.tags.elementAt(0).name),
                        const SizedBox(width: 10,),
                      ],
                    ),
                    const SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.product_country,
                          style: GoogleFonts.montserrat(fontSize: 16.0, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          widget.cartEntity.medicamentEntity.country,
                          style: GoogleFonts.montserrat(fontSize: 16.0, fontWeight: FontWeight.w600, color: const Color(0xff606A69)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.product_dosage,
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
                      AppLocalizations.of(context)!.product_instructions,
                      style: GoogleFonts.montserrat(fontSize: 18.0, fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 20,),
                    SizedBox(
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index){
                          return const InstructionItem();
                        },
                        separatorBuilder: (BuildContext context, int index) => const Divider(),
                        itemCount: 1
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
            return Container(
              decoration: BoxDecoration(
                border: Border(top: BorderSide(color: customBlack.shade100)),
                color: Colors.white
              ),
              padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width*0.4,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(AppLocalizations.of(context)!.price('${widget.cartEntity.medicamentEntity.price}'),
                        style: GoogleFonts.montserrat(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    )
                  ),
                  const SizedBox(width: 5,),
                  BoxHelper.getCartItem(widget.cartEntity) == null ?
                  SizedBox(
                    width: MediaQuery.of(context).size.width*0.5,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: (){
                        BoxHelper.getCartItem(widget.cartEntity) == null? cartBloc.add(AddMedicamentToCartEvent(widget.cartEntity)) : null;
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
                      child: Text(AppLocalizations.of(context)!.product_btn),
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
                      child: Text(AppLocalizations.of(context)!.product_gobtn),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
