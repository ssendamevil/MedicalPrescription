import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/core/util/theme/Colors.dart';
import 'package:medical_prescription/presentation/bloc/catalogue_bloc/catalogue_bloc.dart';
import '../app.dart';
import '../pages/search_page.dart';

class CatalogueScreen extends StatefulWidget {
  CatalogueScreen({Key? key}) : super(key: key);

  final Map<String, List<String>> medicineCategories = {
    "Allergy": ["Adsorbents", "Antihistamines", "Eye and nasal drops"],
    "Blood diseases": [],
    "Dermatological diseases": [],
    "Diabetes": [],
    "Eye and ear drops": [],
    "Flu and colds": [],
    "Gastrointestinal tract and liver": [],
    "Obstetrics and gynecology": [],
    "Respiratory system": [],
  };

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  int ind = 0;
  double leftX = 0;
  String title = 'Catalog';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: title == 'Catalog' ?
        null :
        IconButton(
            onPressed: (){
              setState(() {
                title = 'Catalog';
                leftX = 0;
              });
            },
            icon: const Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            )
        ),
        title: Text(
          title,
          style: GoogleFonts.montserrat(
            textStyle: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
            )
          )
        ),
        centerTitle: title == 'Catalog' ? true : false,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Container(
            height: 170.0,
            width: MediaQuery.of(context).size.width,
            color: const Color(0xff07BEB8),
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width-40.0,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: (){
                      selectedIndexGlobal.value = 1;
                      searchPageScreenIndex.value = 1;
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                          )
                      ),
                      shadowColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                      iconColor: const MaterialStatePropertyAll<Color>(Colors.grey),
                      backgroundColor: const MaterialStatePropertyAll<Color>(Colors.white),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          CupertinoIcons.search,
                          color: Color(0xFF494D51)
                        ),
                        const SizedBox(width: 15,),
                        Text(
                          "Search medicine",
                          style: GoogleFonts.montserrat(
                            textStyle: Theme.of(context).textTheme.titleSmall,
                            color: customBlack.shade400
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.black: Colors.white,
                  ),
                  height: MediaQuery.of(context).size.height,
                  child: ListView.separated(
                    padding: const EdgeInsets.only(top: 10,),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: widget.medicineCategories.values.elementAt(ind).length,
                    itemBuilder: (BuildContext context, int index) {
                      return ElevatedButton(
                        onPressed: (){
                          searchCategoryName.value = widget.medicineCategories.values.elementAt(ind).elementAt(index);
                          searchPageScreenIndex.value = 2;
                        },
                        style: const ButtonStyle(
                          surfaceTintColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                          shadowColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                          backgroundColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                          overlayColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.medicineCategories.values.elementAt(ind).elementAt(index),
                              style: Theme.of(context).textTheme.titleMedium
                            ),
                            const Icon(
                              Iconsax.arrow_right_3,
                              size: 20,
                              color: Color(0xff04726E),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => const Divider(),
                  ),
                ),

                AnimatedPositioned(
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(milliseconds: 1000),
                  left: leftX,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: MediaQuery.of(context).platformBrightness == Brightness.dark ? Colors.black : Colors.white,
                    ),
                    child: ListView.separated(
                      padding: const EdgeInsets.only(top: 10,  bottom: 240),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: widget.medicineCategories.keys.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ElevatedButton(
                          onPressed: (){
                            if(widget.medicineCategories.values.elementAt(index).isEmpty){
                              searchCategoryName.value = widget.medicineCategories.keys.elementAt(index);
                              searchPageScreenIndex.value = 2;
                            }
                            setState(() {
                              ind = index;
                              leftX = -MediaQuery.of(context).size.width;
                              title = widget.medicineCategories.keys.elementAt(index);
                            });
                          },
                          style: const ButtonStyle(
                            surfaceTintColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                            shadowColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                            backgroundColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                            overlayColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.medicineCategories.keys.elementAt(index),
                                style: Theme.of(context).textTheme.titleMedium
                              ),
                              const Icon(
                                Iconsax.arrow_right_3,
                                size: 20,
                                color: Color(0xff04726E),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) => const Divider(),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
