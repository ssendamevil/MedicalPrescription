import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/domain/entities/cart/cart.dart';
import 'package:medical_prescription/presentation/bloc/cart_bloc/cart_bloc.dart';
import 'package:medical_prescription/presentation/bloc/catalogue_bloc/catalogue_bloc.dart';
import 'package:medical_prescription/presentation/bloc/medicament/medicament_bloc.dart';
import 'package:medical_prescription/presentation/pages/patient/search_page.dart';
import 'package:medical_prescription/presentation/components/search_results_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  late TextEditingController _fromEditingController;
  late TextEditingController _toEditingController;
  late CatalogueBloc catalogueBloc;
  late CartBloc cartBloc;
  RangeValues selectedRange = const RangeValues(800, 1500);

  @override
  void initState() {
    super.initState();
    catalogueBloc = context.read<CatalogueBloc>();
    cartBloc = context.read<CartBloc>();
    _fromEditingController = TextEditingController(text: "800");
    _toEditingController = TextEditingController(text: "1500");
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
            onPressed: (){
              searchCategoryName.value = "";
              searchPageScreenIndex.value = 0;
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
            )
        ),
        title: Text(searchCategoryName.value),
      ),
      body: BlocBuilder<MedicamentBloc, MedicamentState>(
        builder: _stateBuilder,
      )
    );
  }

  Widget _stateBuilder(BuildContext context, MedicamentState state) {
    return Skeletonizer(
      enabled: state.state == MedicamentStateType.inProgress,
      child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 17.0, vertical: 5.0),
                  child: Text("${state.medicaments.length} results"),
                ),
                Container(width: MediaQuery
                    .of(context)
                    .size
                    .width, height: 0.5, color: const Color(0xFFD9D9D9),),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          style: ButtonStyle(
                            foregroundColor: const MaterialStatePropertyAll(
                                Colors.black),
                            overlayColor: const MaterialStatePropertyAll(
                                Colors.transparent),
                            textStyle: MaterialStatePropertyAll(Theme
                                .of(context)
                                .textTheme
                                .bodyMedium),
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (((context) {
                                  return Column(
                                    children: [
                                      Container(
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width,
                                        height: 55,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Color(0xffD7D7D7),
                                                    width: 1.0)
                                            )
                                        ),
                                        child: Stack(
                                          children: [
                                            Center(
                                              child: Text("Sorting",
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w600
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                              right: 0,
                                              top: 3,
                                              child: IconButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  icon: const Icon(
                                                      Iconsax.close_circle)
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 10),
                                        child: Column(
                                          children: [
                                            TextButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    const Text("By alphabet"),
                                                    SizedBox(
                                                      width: 25,
                                                      height: 25,
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Container(
                                                              width: 14,
                                                              height: 14,
                                                              decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      100),
                                                                  color: Colors
                                                                      .black
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 25,
                                                            height: 25,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius
                                                                  .circular(100),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black,
                                                                  width: 2),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                )
                                            ),
                                            TextButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    const Text("By alphabet"),
                                                    SizedBox(
                                                      width: 25,
                                                      height: 25,
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Container(
                                                              width: 14,
                                                              height: 14,
                                                              decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      100),
                                                                  color: Colors
                                                                      .black
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 25,
                                                            height: 25,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius
                                                                  .circular(100),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black,
                                                                  width: 2),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                )
                                            ),
                                            TextButton(
                                                onPressed: () {},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    const Text("By alphabet"),
                                                    SizedBox(
                                                      width: 25,
                                                      height: 25,
                                                      child: Stack(
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Container(
                                                              width: 14,
                                                              height: 14,
                                                              decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      100),
                                                                  color: Colors
                                                                      .black
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 25,
                                                            height: 25,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius
                                                                  .circular(100),
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .black,
                                                                  width: 2),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                )
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  );
                                }))
                            );
                          },
                          child: const Row(
                            children: [
                              Icon(Iconsax.arrow_3, size: 20,),
                              SizedBox(width: 10,),
                              Text("By alphabet")
                            ],
                          )
                      ),
                      TextButton(
                          style: ButtonStyle(
                              foregroundColor: const MaterialStatePropertyAll(
                                  Colors.black),
                              overlayColor: const MaterialStatePropertyAll(
                                  Colors.transparent),
                              textStyle: MaterialStatePropertyAll(Theme
                                  .of(context)
                                  .textTheme
                                  .bodyMedium)
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                                shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(22.0)),
                                ),
                                isScrollControlled: true,
                                context: context,
                                builder: (((context) {
                                  return Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5),
                                    height: 570,
                                    width: MediaQuery
                                        .of(context)
                                        .size
                                        .width,
                                    child: Column(
                                      children: [
                                        Stack(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0),
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "Filter",
                                                    style: Theme
                                                        .of(context)
                                                        .textTheme
                                                        .headlineSmall,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: IconButton(
                                                  icon: const Icon(
                                                    Iconsax.close_circle,
                                                    size: 20,),
                                                  onPressed: () {},
                                                ),
                                              ),
                                            ]
                                        ),
                                        const Divider(),
                                        Container(
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional
                                                    .centerEnd,
                                                child: TextButton(
                                                    onPressed: () {},
                                                    style: const ButtonStyle(
                                                      surfaceTintColor: MaterialStatePropertyAll<
                                                          Color>(
                                                          Colors.transparent),
                                                      shadowColor: MaterialStatePropertyAll<
                                                          Color>(
                                                          Colors.transparent),
                                                      backgroundColor: MaterialStatePropertyAll<
                                                          Color>(
                                                          Colors.transparent),
                                                      overlayColor: MaterialStatePropertyAll<
                                                          Color>(
                                                          Colors.transparent),
                                                      padding: MaterialStatePropertyAll(
                                                          EdgeInsets.symmetric(
                                                              horizontal: 0)),
                                                    ),
                                                    child: Text(
                                                        "Reset",
                                                        style: GoogleFonts
                                                            .montserrat(
                                                            fontWeight: FontWeight
                                                                .w600,
                                                            fontSize: 16,
                                                            color: Colors.red
                                                        )
                                                    )
                                                ),
                                              ),
                                              Text(
                                                "Price",
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .titleMedium,
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .spaceBetween,
                                                children: [
                                                  Container(
                                                    height: 60,
                                                    width: 160,
                                                    padding: const EdgeInsets
                                                        .symmetric(vertical: 5,
                                                        horizontal: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .shade400,
                                                        borderRadius: BorderRadius
                                                            .circular(10)
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        const Text('from'),
                                                        SizedBox(
                                                          width: 90,
                                                          child: TextField(
                                                            controller: _fromEditingController,
                                                            textAlign: TextAlign
                                                                .center,
                                                            decoration: const InputDecoration(
                                                                border: InputBorder
                                                                    .none
                                                            ),
                                                            keyboardType: TextInputType
                                                                .number,
                                                          ),
                                                        ),
                                                        const Text("₸")
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 60,
                                                    width: 160,
                                                    padding: const EdgeInsets
                                                        .symmetric(vertical: 5,
                                                        horizontal: 10),
                                                    decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .shade400,
                                                        borderRadius: BorderRadius
                                                            .circular(10)
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        const Text('to'),
                                                        SizedBox(
                                                          width: 90,
                                                          child: TextField(
                                                            controller: _toEditingController,
                                                            textAlign: TextAlign
                                                                .center,
                                                            decoration: const InputDecoration(
                                                                border: InputBorder
                                                                    .none
                                                            ),
                                                            keyboardType: TextInputType
                                                                .number,
                                                          ),
                                                        ),
                                                        const Text("₸")
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(height: 20),
                                              RangeSlider(
                                                  activeColor: Colors.black,
                                                  values: selectedRange,
                                                  max: 1500,
                                                  min: 800,
                                                  divisions: 100,
                                                  onChanged: (
                                                      RangeValues newRange) {
                                                    setState(() {
                                                      selectedRange = newRange;
                                                      _fromEditingController
                                                          .text = newRange.start
                                                          .toString();
                                                      _toEditingController.text =
                                                          newRange.end.toString();
                                                    });
                                                  }
                                              ),
                                              Column(
                                                children: [
                                                  TextButton(
                                                      style: const ButtonStyle(
                                                          surfaceTintColor: MaterialStatePropertyAll<
                                                              Color>(
                                                              Colors.transparent),
                                                          shadowColor: MaterialStatePropertyAll<
                                                              Color>(
                                                              Colors.transparent),
                                                          backgroundColor: MaterialStatePropertyAll<
                                                              Color>(
                                                              Colors.transparent),
                                                          overlayColor: MaterialStatePropertyAll<
                                                              Color>(
                                                              Colors.transparent),
                                                          padding: MaterialStatePropertyAll(
                                                              EdgeInsets
                                                                  .symmetric(
                                                                  horizontal: 0))
                                                      ),
                                                      onPressed: () {
                                                        releaseFormModal(context);
                                                      },
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Text(
                                                              'Release form',
                                                              style: Theme
                                                                  .of(context)
                                                                  .textTheme
                                                                  .titleMedium
                                                          ),
                                                          const Icon(
                                                            Iconsax.arrow_right_3,
                                                            size: 25,
                                                            color: Colors.black,
                                                          )
                                                        ],
                                                      )
                                                  ),
                                                  const Divider(),
                                                  TextButton(
                                                      style: const ButtonStyle(
                                                          surfaceTintColor: MaterialStatePropertyAll<
                                                              Color>(
                                                              Colors.transparent),
                                                          shadowColor: MaterialStatePropertyAll<
                                                              Color>(
                                                              Colors.transparent),
                                                          backgroundColor: MaterialStatePropertyAll<
                                                              Color>(
                                                              Colors.transparent),
                                                          overlayColor: MaterialStatePropertyAll<
                                                              Color>(
                                                              Colors.transparent),
                                                          padding: MaterialStatePropertyAll(
                                                              EdgeInsets
                                                                  .symmetric(
                                                                  horizontal: 0))
                                                      ),
                                                      onPressed: () {},
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Text(
                                                              'Dosage',
                                                              style: Theme
                                                                  .of(context)
                                                                  .textTheme
                                                                  .titleMedium
                                                          ),
                                                          const Icon(
                                                            Iconsax.arrow_right_3,
                                                            size: 25,
                                                            color: Colors.black,
                                                          )
                                                        ],
                                                      )
                                                  ),
                                                  const Divider(),
                                                  TextButton(
                                                      style: const ButtonStyle(
                                                          surfaceTintColor: MaterialStatePropertyAll<
                                                              Color>(
                                                              Colors.transparent),
                                                          shadowColor: MaterialStatePropertyAll<
                                                              Color>(
                                                              Colors.transparent),
                                                          backgroundColor: MaterialStatePropertyAll<
                                                              Color>(
                                                              Colors.transparent),
                                                          overlayColor: MaterialStatePropertyAll<
                                                              Color>(
                                                              Colors.transparent),
                                                          padding: MaterialStatePropertyAll(
                                                              EdgeInsets
                                                                  .symmetric(
                                                                  horizontal: 0))
                                                      ),
                                                      onPressed: () {},
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Text(
                                                              'Producer country',
                                                              style: Theme
                                                                  .of(context)
                                                                  .textTheme
                                                                  .titleMedium
                                                          ),
                                                          const Icon(
                                                            Iconsax.arrow_right_3,
                                                            size: 25,
                                                            color: Colors.black,
                                                          )
                                                        ],
                                                      )
                                                  ),
                                                  const Divider(),
                                                ],
                                              ),
                                              const SizedBox(height: 20,),
                                              Align(
                                                alignment: Alignment.bottomCenter,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment
                                                      .stretch,
                                                  children: [
                                                    SizedBox(
                                                      height: 50,
                                                      child: ElevatedButton(
                                                        onPressed: () {},
                                                        style: ButtonStyle(
                                                            surfaceTintColor: const MaterialStatePropertyAll<
                                                                Color>(Colors
                                                                .transparent),
                                                            shadowColor: const MaterialStatePropertyAll<
                                                                Color>(Colors
                                                                .transparent),
                                                            backgroundColor: const MaterialStatePropertyAll<
                                                                Color>(Color(
                                                                0xff007AD2)),
                                                            shape: MaterialStatePropertyAll<
                                                                RoundedRectangleBorder>(
                                                                RoundedRectangleBorder(
                                                                  borderRadius: BorderRadius
                                                                      .circular(
                                                                      10.0),
                                                                )
                                                            )
                                                        ),
                                                        child: Text(
                                                            "Show 2 products",
                                                            style: GoogleFonts
                                                                .montserrat(
                                                                fontWeight: FontWeight
                                                                    .w600,
                                                                fontSize: 16,
                                                                color: Colors
                                                                    .white
                                                            )
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }))
                            );
                          },
                          child: const Row(
                            children: [
                              Text("Filter",),
                              SizedBox(width: 10,),
                              Icon(Iconsax.setting_4, size: 20,),
                            ],
                          )
                      )
                    ],
                  ),
                ),
                Container(width: MediaQuery
                    .of(context)
                    .size
                    .width, height: 1, color: const Color(0xFFAAAAAA),)
              ],
            ),
            Expanded(
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                color: const Color(0xffF0F0F0),
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  itemBuilder: (BuildContext context, int index) {
                    return SearchResultsItem(
                      cartEntity: CartEntity(state.medicaments.elementAt(index).id.toString(), state.medicaments.elementAt(index), 1, 1),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15,),
                  itemCount: state.medicaments.length,
                ),
              ),
            )
          ],
        ),
    );

  }
}


Future releaseFormModal(BuildContext context){
  return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (((context){
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          height: 700,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Release form",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        icon: const Icon(CupertinoIcons.left_chevron),
                        onPressed: () {
                        },
                      ),
                    ),
                  ]
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Selected: 0",)
                    ),
                    const SizedBox(height: 10,),
                    SizedBox(
                      height: 500,
                      child: ListView.separated(
                        itemBuilder: (BuildContext context, int index){
                          return SizedBox(
                            height: 50,
                            child: Row(
                              children: [
                                Checkbox(
                                  value: true,
                                  onChanged: (bool? val) {
                                  }
                                ),
                                const Text("5 UNITS/ml")
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) => const Divider() ,
                        itemCount: 5
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: (){},
                              style: ButtonStyle(
                                  surfaceTintColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                                  shadowColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                                  backgroundColor: const MaterialStatePropertyAll<Color>(Color(0xff007AD2)),
                                  shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0),
                                      )
                                  )
                              ),
                              child: Text(
                                  "Done",
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Colors.white
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }))
  );
}