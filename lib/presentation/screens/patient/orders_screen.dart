import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/core/util/theme/Colors.dart';
import 'package:medical_prescription/presentation/bloc/order/order_bloc.dart';
import 'package:medical_prescription/presentation/components/order_screen_item.dart';
import 'package:medical_prescription/presentation/pages/patient/profile_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  late OrderBloc _orderBloc;
  bool isLoading = false;

  @override
  void initState() {
    _orderBloc = context.read<OrderBloc>();
    _orderBloc.add(GetAllOrdersByPatientEvent());
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF0F0F0),
        appBar: AppBar(
          scrolledUnderElevation: 0,
          leading: IconButton(
              onPressed: (){
                profilePageIndex.value = 0;
              },
              icon: const Icon(Iconsax.arrow_left)
          ),
          title: Text(
            AppLocalizations.of(context)!.profile_table_items_orders,
          ),
          centerTitle: true,
          shape: Border(
              bottom: BorderSide(color: customBlack.shade100, width: 1)
          ),
        ),
        body: BlocBuilder<OrderBloc, OrderState>(
          builder: _stateBuilder
        )
      ),
    );
  }

  Widget _stateBuilder(BuildContext context, OrderState state) {
    return Skeletonizer(
      enabled: state.stateType == OrderStateType.isLoading,
      child: Expanded(
        child: Column(
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
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                itemBuilder: (BuildContext context, int index){
                  return OrderScreenItem(orderEntity: state.orders.elementAt(index),);
                },
                separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 10,),
                itemCount: state.orders.length
              )
            )
          ],
        ),
      ),
    );
  }
}
