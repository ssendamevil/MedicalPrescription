import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/domain/entities/cartItem.dart';
import 'package:medical_prescription/presentation/bloc/cart_bloc/cart_bloc.dart';

class CartPageItem extends StatefulWidget {
  const CartPageItem({Key? key, required this.cartItemEntity}) : super(key: key);

  final CartItemEntity cartItemEntity;

  @override
  State<CartPageItem> createState() => _CartPageItemState();
}

class _CartPageItemState extends State<CartPageItem> {
  late CartBloc cartBloc;
  int count = 1;

  @override
  void initState() {
    cartBloc = context.read<CartBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (context, state) {
        return Container(
          width: 100,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                offset: Offset(1.0, 1.0),
                blurRadius: 1,
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
                              height: 40,
                              width: 130,
                              child: BlocBuilder<CartBloc, CartState>(
                              builder: (context, state) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      widget.cartItemEntity.itemCount > 1 ?
                                        IconButton(
                                          onPressed: () {
                                            cartBloc.add(ChangeItemCount(widget.cartItemEntity, widget.cartItemEntity.itemCount-1));
                                          },
                                          icon: const Icon(Iconsax.minus, size: 20,),
                                          style: const ButtonStyle(
                                              side: MaterialStatePropertyAll(BorderSide(color:Colors.black)),
                                              surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
                                              overlayColor: MaterialStatePropertyAll(Colors.transparent)
                                          ),
                                        ) :
                                        IconButton(
                                          onPressed: () {
                                            showModalBottomSheet(
                                                context: context,
                                                builder: ((context){
                                                  return Container(
                                                    height: 180,
                                                    width: MediaQuery.of(context).size.width,
                                                    padding: const EdgeInsets.only(top: 30, bottom: 30, right: 15, left: 15),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                    ),
                                                    child: Column(
                                                      children: [
                                                        Text("Do you want to remove a product?",
                                                          style: GoogleFonts.montserrat(
                                                            fontWeight: FontWeight.w600,
                                                            fontSize: 18.0
                                                          ),
                                                        ),
                                                        const SizedBox(height: 20,),
                                                        Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            SizedBox(
                                                              width: 170,
                                                              height: 56,
                                                              child: OutlinedButton(
                                                                onPressed: (){Navigator.of(context).pop();},
                                                                style: ButtonStyle(
                                                                  foregroundColor: const MaterialStatePropertyAll(Color(0xff199A8E)),
                                                                  side: const MaterialStatePropertyAll(BorderSide(
                                                                    color: Color(0xff199A8E),width: 2.0
                                                                  )),
                                                                  textStyle: MaterialStatePropertyAll(GoogleFonts.montserrat(
                                                                    fontSize: 16,
                                                                    fontWeight: FontWeight.w500
                                                                  )),
                                                                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                                                      borderRadius: BorderRadius.circular(10)
                                                                  ))
                                                                ),
                                                                child: const Text("Cancel"),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 170,
                                                              height: 56,
                                                              child: ElevatedButton(
                                                                onPressed: (){
                                                                  cartBloc.add(RemoveMedicamentToCartEvent(widget.cartItemEntity));
                                                                  Navigator.of(context).pop();
                                                                },
                                                                style: ButtonStyle(
                                                                  foregroundColor: const MaterialStatePropertyAll(Colors.white),
                                                                  backgroundColor: const MaterialStatePropertyAll(Colors.red),
                                                                  textStyle: MaterialStatePropertyAll(GoogleFonts.montserrat(
                                                                      fontSize: 16,
                                                                      fontWeight: FontWeight.w500
                                                                  )),
                                                                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                                                    borderRadius: BorderRadius.circular(10)
                                                                  ))
                                                                ),
                                                                child: const Text("Remove"),
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    )
                                                  );
                                                })
                                            );
                                          },
                                          icon: const Icon(Iconsax.trash, size: 20, color: Colors.red),
                                          style: const ButtonStyle(
                                              side: MaterialStatePropertyAll(BorderSide(color:Colors.red)),
                                              surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
                                              overlayColor: MaterialStatePropertyAll(Colors.transparent)
                                          ),
                                        ),
                                      SizedBox(
                                        width: 33,
                                        child: Center(
                                          child: Text(
                                            "${widget.cartItemEntity.itemCount}",
                                            style: const TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w600
                                            ),
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        style: const ButtonStyle(
                                            side: MaterialStatePropertyAll(BorderSide(color: Colors.black)),
                                            surfaceTintColor: MaterialStatePropertyAll(Colors.transparent),
                                            overlayColor: MaterialStatePropertyAll(Colors.transparent)
                                        ),
                                        onPressed: (){
                                          cartBloc.add(ChangeItemCount(widget.cartItemEntity, widget.cartItemEntity.itemCount+1));
                                        },
                                        icon: const Icon(Iconsax.add)
                                      )
                                    ],
                                  );
                                },
                              )
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
      },
    );
  }
}
