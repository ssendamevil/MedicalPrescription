import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/presentation/bloc/order/order_bloc.dart';
import 'package:medical_prescription/presentation/components/order_products_item.dart';
import 'package:medical_prescription/presentation/pages/patient/cart_page.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../core/util/theme/Colors.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<OrderBloc, OrderState>(
        builder: (context, state) {
          return Skeletonizer(
            enabled: state.stateType == OrderStateType.isLoading,
            child: Scaffold(
                extendBody: true,
                backgroundColor: const Color(0xffF0F0F0),
                appBar: AppBar(
                  scrolledUnderElevation: 0,
                  leading: IconButton(
                      onPressed: (){
                        cartPageIndex.value = 0;
                      },
                      icon: const Icon(Iconsax.arrow_left)
                  ),
                  title: Text(
                    AppLocalizations.of(context)!.order_screen_title('${state.orderEntity.id}'),
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
                                AppLocalizations.of(context)!.order_status_approved,
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
                                AppLocalizations.of(context)!.order_status_shelflife,
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
                                    Text(AppLocalizations.of(context)!.order_pickup, style: GoogleFonts.montserrat(fontSize: 18.0, fontWeight: FontWeight.w600),),
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
                            Row(
                              children: [
                                const Icon(Iconsax.warning_2, size: 16,color: Colors.orange,),
                                const SizedBox(width: 5,),
                                Text(
                                  AppLocalizations.of(context)!.pharmacy_pres_status,
                                  style: const TextStyle(
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
                            const SizedBox(height: 15,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 45,
                                child: ElevatedButton(
                                  onPressed: () {
                                    showModalBottomSheet(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0)),
                                        ),
                                        context: context,
                                        builder: (((context){
                                          return Container(
                                            padding: const EdgeInsets.symmetric(vertical: 30),
                                            height: 400,
                                            child: Column(
                                              children: [
                                                Text(
                                                  AppLocalizations.of(context)!.qr_title_label,
                                                  style: GoogleFonts.montserrat(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.w700
                                                  ),
                                                ),
                                                const SizedBox(height: 20,),
                                                RepaintBoundary(
                                                  key: globalKey,
                                                  child: Center(
                                                    child: QrImageView(
                                                      data: state.orderEntity.token,
                                                      version: QrVersions.auto,
                                                      size: 200,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 20,),
                                                const Text("№1784554884"),
                                                const SizedBox(height: 10,),
                                                Text(AppLocalizations.of(context)!.avaible_prod("1")),
                                              ],
                                            ),
                                          );
                                        }))
                                    );
                                  },
                                  style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10)
                                    )),
                                    surfaceTintColor: const MaterialStatePropertyAll(Colors.black),
                                    backgroundColor: const MaterialStatePropertyAll(Color(0xff198A8E)),
                                    foregroundColor: const MaterialStatePropertyAll(Colors.white),
                                    overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                                    textStyle: MaterialStatePropertyAll(GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16)),
                                  ),
                                  child: Text(AppLocalizations.of(context)!.qr_show_btn),
                                ),
                              ),
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
                            Text(AppLocalizations.of(context)!.items_on_order, style: GoogleFonts.montserrat(fontSize: 18.0, fontWeight: FontWeight.w600),),
                            Text(AppLocalizations.of(context)!.avaible_prod('1')),
                            const SizedBox(height: 10,),
                            const OrderProductItem(),
                            const SizedBox(height: 20,),
                            Text(AppLocalizations.of(context)!.my_order_label, style: GoogleFonts.montserrat(fontSize: 20.0, fontWeight: FontWeight.w600),),
                            const SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(AppLocalizations.of(context)!.item_count("1"), style: GoogleFonts.montserrat(fontSize: 16.0),),
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
                                Text(AppLocalizations.of(context)!.total, style: GoogleFonts.montserrat(fontSize: 16.0, fontWeight: FontWeight.w600),),
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
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Icon(CupertinoIcons.clear_circled),
                                  const SizedBox(width: 10,),
                                  Text(AppLocalizations.of(context)!.cancel_order_btn)
                                ],
                              ),
                            ),
                            const SizedBox(height: 10,)
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ),
          );
        },
      ),
    );
  }
}
