import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/data/data_sources/local/hive/box_helper.dart';
import 'package:medical_prescription/presentation/screens/patient/map_screen.dart';
import 'package:medical_prescription/presentation/components/cart_page_item.dart';
import 'package:medical_prescription/presentation/screens/patient/map_screen_google.dart';
import 'package:medical_prescription/presentation/widgets/shimmer_box.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../bloc/cart_bloc/cart_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartBloc cartBloc;
  bool isLoading = false;
  double total = 0;
  int previousLength = 0;

  @override
  void initState() {
    cartBloc = context.read<CartBloc>();
    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              shape: const Border(
                bottom: BorderSide(
                  color: Color(0xffD9D9D9)
                )
              ),
              scrolledUnderElevation: 0,
              title: Text(
                AppLocalizations.of(context)!.navbar_item_cart,
              ),
              centerTitle: true,
            ),
            body: Container(
              width: MediaQuery.of(context).size.width,
              color: BoxHelper.getCart()!.isEmpty? Colors.white : const Color(0xffF0F0F0),
              child: BoxHelper.getCart()!.isEmpty ?
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/Cart_emptystate.png", height: 230,),
                      Text(
                        AppLocalizations.of(context)!.cart_empty,
                        style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.w600,)
                      )
                    ],
                  ),
                ) : 
                 ListView.separated(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                              Text(AppLocalizations.of(context)!.cart_pickup, style: GoogleFonts.montserrat(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 15))
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Text(AppLocalizations.of(context)!.price(
                              "${BoxHelper.getCart()?.map((item){
                                if(BoxHelper.getCart()!.length > previousLength){
                                  total += item.medicamentEntity.price * item.itemCount;
                                  previousLength = BoxHelper.getCart()!.length;
                                }else{
                                  total -= item.medicamentEntity.price * item.itemCount;
                                  previousLength = BoxHelper.getCart()!.length;
                                }
                                return total;
                              }).toList().elementAt(BoxHelper.getCart()!.length-1).round()}"),
                              style: GoogleFonts.montserrat(
                                  color: const Color(0xff04726E),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16)
                          )
                        ],
                      ),
                    ElevatedButton(
                        onPressed: (){
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) => const MapScreenGoogle(),
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
                        child: Text(
                          AppLocalizations.of(context)!.cart_pharmacy_btn,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          softWrap: true,
                          style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14))
                      )
                  ],
                ),
              )
            : null
          ),
        );
      }
    );
  }
}
