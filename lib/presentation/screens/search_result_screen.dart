import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/presentation/bloc/catalogue_bloc/catalogue_bloc.dart';
import 'package:medical_prescription/presentation/widgets/search_results_item.dart';
import '../pages/search_page.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {
  late TextEditingController _fromEditingController;
  late TextEditingController _toEditingController;
  late CatalogueBloc catalogueBloc;
  RangeValues selectedRange = const RangeValues(800, 1500);

  @override
  void initState() {
    super.initState();
    catalogueBloc = context.read<CatalogueBloc>();
    _fromEditingController = TextEditingController(text: "800");
    _toEditingController = TextEditingController(text: "1500");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 17.0,vertical: 5.0),
                child: Text("2 results"),
              ),
              Container(width: MediaQuery.of(context).size.width,height: 0.5,color: const Color(0xFFD9D9D9),),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: const MaterialStatePropertyAll(Colors.black),
                        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                        textStyle: MaterialStatePropertyAll(Theme.of(context).textTheme.bodyMedium),
                      ),
                      onPressed: (){},
                      child: const Row(
                        children: [
                          Icon(Iconsax.arrow_3,size: 20,),
                          SizedBox(width: 10,),
                          Text("By alphabet")
                        ],
                      )
                    ),
                    TextButton(
                      style: ButtonStyle(
                        foregroundColor: const MaterialStatePropertyAll(Colors.black),
                        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                        textStyle: MaterialStatePropertyAll(Theme.of(context).textTheme.bodyMedium)
                      ),
                      onPressed: (){
                        showModalBottomSheet(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(22.0)),
                          ),
                          isScrollControlled: true,
                          context: context,
                          builder: (((context){
                            return Container(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              height: 570,
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
                                            "Filter",
                                            style: Theme.of(context).textTheme.headlineSmall,
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                          icon: const Icon(Iconsax.close_circle, size: 20,),
                                          onPressed: () {  },
                                        ),
                                      ),
                                    ]
                                  ),
                                  const Divider(),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Align(
                                          alignment: AlignmentDirectional.centerEnd,
                                          child: TextButton(
                                            onPressed: (){},
                                            style: const ButtonStyle(
                                                surfaceTintColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                                                shadowColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                                                backgroundColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                                                overlayColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                                                padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 0)),
                                            ),
                                            child: Text(
                                              "Reset",
                                              style: GoogleFonts.montserrat(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 16,
                                                color: Colors.red
                                              )
                                            )
                                          ),
                                        ),
                                        Text(
                                          "Price",
                                          style: Theme.of(context).textTheme.titleMedium,
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 60,
                                              width: 160,
                                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade400,
                                                borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  const Text('from'),
                                                  SizedBox(
                                                    width: 90,
                                                    child: TextField(
                                                      controller: _fromEditingController,
                                                      textAlign: TextAlign.center,
                                                      decoration: const InputDecoration(
                                                        border: InputBorder.none
                                                      ),
                                                      keyboardType: TextInputType.number,
                                                    ),
                                                  ),
                                                  const Text("₸")
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 60,
                                              width: 160,
                                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade400,
                                                borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  const Text('to'),
                                                  SizedBox(
                                                    width: 90,
                                                    child: TextField(
                                                      controller: _toEditingController,
                                                      textAlign: TextAlign.center,
                                                      decoration: const InputDecoration(
                                                          border: InputBorder.none
                                                      ),
                                                      keyboardType: TextInputType.number,
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
                                          onChanged: (RangeValues newRange){
                                            setState((){
                                              selectedRange = newRange;
                                              _fromEditingController.text = newRange.start.toString();
                                              _toEditingController.text = newRange.end.toString();
                                            });
                                          }
                                        ),
                                        Column(
                                          children: [
                                            TextButton(
                                              style: const ButtonStyle(
                                                surfaceTintColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                                                shadowColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                                                backgroundColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                                                overlayColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                                                padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 0))
                                              ),
                                              onPressed: (){
                                                releaseFormModal(context);
                                              },
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    'Release form',
                                                    style: Theme.of(context).textTheme.titleMedium
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
                                                    surfaceTintColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                                                    shadowColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                                                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                                                    overlayColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                                                    padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 0))
                                                ),
                                                onPressed: (){},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                        'Dosage',
                                                        style: Theme.of(context).textTheme.titleMedium
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
                                                    surfaceTintColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                                                    shadowColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                                                    backgroundColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                                                    overlayColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                                                    padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 0))
                                                ),
                                                onPressed: (){},
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                        'Producer country',
                                                        style: Theme.of(context).textTheme.titleMedium
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
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              SizedBox(
                                                height: 50,
                                                child: ElevatedButton(
                                                  onPressed: (){},
                                                  child: Text(
                                                      "Show 2 products",
                                                      style: GoogleFonts.montserrat(
                                                          fontWeight: FontWeight.w600,
                                                          fontSize: 16,
                                                          color: Colors.white
                                                      )
                                                  ),
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
              Container(width: MediaQuery.of(context).size.width,height: 1,color: const Color(0xFFAAAAAA),)
            ],
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20,),
              width: MediaQuery.of(context).size.width,
              color: const Color(0xffF0F0F0),
              child: ListView(
                children: const [
                  SizedBox(height: 15,),
                  SearchResultsItem(),
                  SizedBox(height: 15,),
                  SearchResultsItem()
                ],
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
                              child: Text(
                                  "Done",
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Colors.white
                                  )
                              ),
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