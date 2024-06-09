import 'package:flutter/material.dart';
import 'package:medical_prescription/domain/entities/order/order.dart';
import 'package:medical_prescription/presentation/components/order_screen_item.dart';

class RecentOrderSlider extends StatelessWidget {
  const RecentOrderSlider({Key? key, required this.orders}) : super(key: key);
  final List<OrderEntity> orders;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: index==0? const EdgeInsets.only(left: 20.0, right: 5.0,top: 15.0, bottom: 15.0) :
            index==orders.length-1? const EdgeInsets.only(left: 5.0, right: 20.0,top: 15.0, bottom: 15.0) : const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
            child: OrderScreenItem(orderEntity: orders.elementAt(index),),
          );
        },
        itemCount: orders.length,
      ),
    );
  }
}

