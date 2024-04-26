import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/domain/entities/cartItem.dart';
import 'package:medical_prescription/domain/entities/medicament.dart';
import 'package:medical_prescription/presentation/bloc/cart_bloc/cart_bloc.dart';

class SearchResultsItem extends StatefulWidget {
  const SearchResultsItem({Key? key}) : super(key: key);

  @override
  State<SearchResultsItem> createState() => _SearchResultsItemState();
}

class _SearchResultsItemState extends State<SearchResultsItem> {
  late CartBloc cartBloc;

  CartItemEntity cartItemEntity = CartItemEntity("1234", MedicamentEntity("name", "price", "country", "company", 1), 1);

  @override
  void initState() {
    cartBloc = context.read<CartBloc>();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            color: Color(0xffB1B0B0)
          )
        ]
      ),
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: const MaterialStatePropertyAll(Colors.black),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            )
          ),
          backgroundColor: const MaterialStatePropertyAll(Colors.white),
          overlayColor: const MaterialStatePropertyAll(Colors.transparent),
        ),
        onPressed: (){},
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.network("https://st.europharma.kz/cache/product/2135/x248_5f6874ea35695.png"),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Но-шпа", style: Theme.of(context).textTheme.headlineSmall,),
                        const SizedBox(height: 4,),
                        const Row(
                          children: [
                            Icon(Iconsax.warning_2, size: 16,color: Colors.orange,),
                            SizedBox(width: 5,),
                            Text(
                              "On Prescription",
                              style: TextStyle(
                                  color: Colors.orange
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5,),
                        Text("Flacon, 0.5g",style: Theme.of(context).textTheme.bodyLarge,),
                        const SizedBox(height: 5,),
                        Text("PJSC Sintez Joint Stock Kurgan, Russia",style: Theme.of(context).textTheme.bodyLarge,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("from 354₸", style: Theme.of(context).textTheme.titleLarge,),
                        SizedBox(
                          height: 37,
                          width: 100,
                          child: BlocBuilder<CartBloc, CartState>(
                            builder: (context, state) {
                              return ElevatedButton(
                                style: ButtonStyle(
                                  overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                                  foregroundColor: const MaterialStatePropertyAll(Colors.black),
                                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0))),
                                  backgroundColor: state.cartItems.contains(cartItemEntity)? const MaterialStatePropertyAll(Color(0xffAAAAAA)) : const MaterialStatePropertyAll(Color(0xff39CBC6))
                                ),
                                onPressed: (){
                                  state.cartItems.contains(cartItemEntity)? null : cartBloc.add(AddMedicamentToCartEvent(cartItemEntity));
                                },
                                child: Text( state.cartItems.contains(cartItemEntity)?"In cart" : "Add", style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14))
                              );
                            }
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
