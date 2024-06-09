import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_prescription/domain/entities/order/order.dart';
import 'package:medical_prescription/presentation/bloc/order/order_bloc.dart';
import 'package:medical_prescription/presentation/components/status_label.dart';
import 'package:medical_prescription/presentation/screens/patient/order_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrderScreenItem extends StatefulWidget {
  const OrderScreenItem({Key? key, required this.orderEntity}) : super(key: key);
  final OrderEntity orderEntity;

  @override
  State<OrderScreenItem> createState() => _OrderScreenItemState();
}

class _OrderScreenItemState extends State<OrderScreenItem> {
  late OrderBloc _orderBloc;

  @override
  void initState() {
    _orderBloc = context.read<OrderBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width-40,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: const [
          BoxShadow(
              offset: Offset(4, 4),
              color: Color(0xffE7E7E7),
              blurRadius: 3
          ),
          BoxShadow(
              offset: Offset(-3, -3),
              color: Color(0xffE7E7E7),
              blurRadius: 3
          ),
        ],
        color: Colors.white,
      ),
      child: InkWell(
        onTap: (){
          _orderBloc.add(UpdateOrderItemEvent(widget.orderEntity));
          Navigator.of(context).push(CupertinoPageRoute(builder: (context) => const OrderScreen()));
        },
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const StatusLabel(status: "Готов к выдаче", isOrder: true),
                Text(widget.orderEntity.total.toString(), style: GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 18.0),)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${AppLocalizations.of(context)!.order_pickup} №${widget.orderEntity.id}", style: GoogleFonts.montserrat(fontSize: 12.0,color: Colors.grey),),
                Text("2 ${AppLocalizations.of(context)!.product_title.toLowerCase()}", style: GoogleFonts.montserrat(fontSize: 12.0),)
              ],
            ),
            const SizedBox(height: 10,),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 65,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return FadeInImage(
                    image: NetworkImage(widget.orderEntity.medicaments.elementAt(index).imageUrl),
                    placeholder: const AssetImage("assets/images/pill.png"),
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Image.asset('assets/images/pill.png',);
                    },
                    fit: BoxFit.fitWidth,
                  );
                },
                separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 5,),
                itemCount: widget.orderEntity.medicaments.length
              ),
            )
          ],
        ),
      ),
    );
  }
}
