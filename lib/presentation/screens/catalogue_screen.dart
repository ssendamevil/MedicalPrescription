import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_prescription/core/util/theme/Colors.dart';
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
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
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
                textStyle: Theme.of(context).textTheme.headlineSmall,
                color: Colors.black
            ),
          ),
          centerTitle: title == 'Catalog' ? true : false,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: Column(
          children: [
            Container(
              height: 140.0,
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
                            Icons.search,
                            color: Color(0xFF494D51)
                          ),
                          const SizedBox(width: 15,),
                          Text(
                            "Find medicine",
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
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    height: MediaQuery.of(context).size.height,
                    child: ListView.separated(
                      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: widget.medicineCategories.values.elementAt(ind).length,
                      itemBuilder: (BuildContext context, int index) {
                        return ElevatedButton(
                          onPressed: (){},
                          style: const ButtonStyle(
                            surfaceTintColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                            shadowColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                            backgroundColor: MaterialStatePropertyAll<Color>(Colors.transparent),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.medicineCategories.values.elementAt(ind).elementAt(index),
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    color: Colors.black
                                ),
                              ),
                              const Icon(
                                Icons.arrow_forward_ios_sharp,
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
                      decoration: const BoxDecoration(
                          color: Colors.white
                      ),
                      child: ListView.separated(
                        padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: widget.medicineCategories.keys.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ElevatedButton(
                            onPressed: (){
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
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  widget.medicineCategories.keys.elementAt(index),
                                  style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Colors.black
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_forward_ios_sharp,
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
      ),
    );
  }
}
