import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/data/data_sources/local/hive/box_helper.dart';
import 'package:medical_prescription/domain/entities/cart/cart.dart';
import 'package:medical_prescription/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:medical_prescription/presentation/screens/patient/medicament_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchResultsItem extends StatefulWidget {
  const SearchResultsItem({Key? key, required this.cartEntity}) : super(key: key);
  final CartEntity cartEntity;

  @override
  State<SearchResultsItem> createState() => _SearchResultsItemState();
}

class _SearchResultsItemState extends State<SearchResultsItem> {
  late CartBloc cartBloc;

  @override
  void initState() {
    cartBloc = context.read<CartBloc>();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: 150,
        height: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
                offset: Offset(0, 1.0),
                blurRadius: 5,
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
          onPressed: (){
            Navigator.push(context, CupertinoPageRoute(builder: (context) => MedicamentScreen(cartEntity: widget.cartEntity,)));
          },
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: widget.cartEntity.medicamentEntity.imageUrl != ""?
                  Image.network(widget.cartEntity.medicamentEntity.imageUrl)
                : Image.asset('assets/images/pill.png'),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.cartEntity.medicamentEntity.name, style: Theme.of(context).textTheme.headlineSmall,),
                          const SizedBox(height: 4,),
                          Row(
                            children: [
                              const Icon(Iconsax.warning_2, size: 16,color: Colors.orange,),
                              const SizedBox(width: 5,),
                              Text(
                                AppLocalizations.of(context)!.on_prescription_label,
                                style: const TextStyle(
                                    color: Colors.orange
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 5,),
                          Text("№30 капс",style: Theme.of(context).textTheme.bodyLarge,),
                          const SizedBox(height: 5,),
                          Text("Claus Marsh, США",style: Theme.of(context).textTheme.bodyLarge,),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(AppLocalizations.of(context)!.price("${widget.cartEntity.medicamentEntity.price.round()}"), style: Theme.of(context).textTheme.titleLarge,),
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
                                    backgroundColor: BoxHelper.getCartItem(widget.cartEntity) != null ?
                                      const MaterialStatePropertyAll(Color(0xffAAAAAA)) :
                                      const MaterialStatePropertyAll(Color(0xff199A8E))
                                  ),
                                  onPressed: (){
                                    BoxHelper.getCartItem(widget.cartEntity) != null?
                                      null :
                                      cartBloc.add(AddMedicamentToCartEvent(widget.cartEntity));
                                  },
                                  child: Text(
                                      BoxHelper.getCartItem(widget.cartEntity) != null?
                                      "In cart" :
                                      "Add",
                                    style: GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 14)
                                  )
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
      ),
    );
  }
}
