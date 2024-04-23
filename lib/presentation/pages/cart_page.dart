import 'package:flutter/material.dart';
import 'package:medical_prescription/presentation/screens/cart_screen.dart';

final ValueNotifier cartPageIndex = ValueNotifier(1);

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: cartPageIndex,
        builder: (context, val, index){
          return const CartScreen();
        }
    );
  }
}
