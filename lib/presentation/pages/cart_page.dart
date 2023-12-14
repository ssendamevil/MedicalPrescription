import 'package:flutter/material.dart';
import 'package:medical_prescription/presentation/app.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text("Cart"),
            ElevatedButton(
                onPressed: (){
                  selectedIndexGlobal.value = 4;
                },
                child: Text("To Profile")
            )
          ],
        ),
      ),
    );
  }
}
