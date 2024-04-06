import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/presentation/widgets/cart_page_item.dart';



class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Text(
            "Cart"
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: MediaQuery.of(context).size.width,
          color: const Color(0xffF0F0F0),
          child: ListView(
            children: const [
              SizedBox(height: 15,),
              CartPageItem(),
              SizedBox(height: 15,),
              CartPageItem(),
              SizedBox(height: 15,),
              CartPageItem(),
              SizedBox(height: 15,),
              CartPageItem()
            ],
          ),
        ),
        persistentFooterButtons: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        children: [
                          Icon(Iconsax.bag),
                          Text("Pick Up")
                        ],
                      ),
                      Text("from 2110₸")
                    ],
                  ),
                  ElevatedButton(
                      onPressed: (){},
                      child: Text("Take from pharmacy")
                  )
                ],
            ),
          )
        ],
      )
    );
  }
}
