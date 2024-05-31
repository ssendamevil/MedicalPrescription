import 'package:flutter/material.dart';
import 'package:medical_prescription/presentation/screens/patient/cart_screen.dart';
import 'package:medical_prescription/presentation/screens/patient/order_screen.dart';

final ValueNotifier cartPageIndex = ValueNotifier(0);

class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  final List<Widget> screens = [
    const CartScreen(),
    const OrderScreen()
  ];

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: cartPageIndex,
        builder: (context, val, index){
          return widget.screens.elementAt(cartPageIndex.value);
        }
    );
  }
}