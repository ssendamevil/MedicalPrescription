import 'package:flutter/material.dart';
import 'package:medical_prescription/presentation/components/order_screen_item.dart';

class RecentOrderSlider extends StatelessWidget {
  const RecentOrderSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: index==0? const EdgeInsets.only(left: 20.0, right: 5.0,top: 15.0, bottom: 15.0) :
            index==7? const EdgeInsets.only(left: 5.0, right: 20.0,top: 15.0, bottom: 15.0) : const EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
            child: const OrderScreenItem(),
          );
        },
        itemCount: 1,
      ),
    );
  }
}

/*
Padding(
padding: const EdgeInsets.only(left: 20.0, top: 5.0, bottom: 5.0, right: 5.0),
child: Container(
width: MediaQuery.of(context).size.width-40,
decoration: const BoxDecoration(
color: Colors.grey,
borderRadius: BorderRadius.all(Radius.circular(10.0)),
),
),
),*/
