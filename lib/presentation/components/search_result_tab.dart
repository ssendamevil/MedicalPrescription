import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/presentation/pages/patient/search_page.dart';

Widget searchResultTab(bool isHistory,String searchResult, BuildContext context){
  return SizedBox(
    height: 50,
    child: TextButton(
      style: const ButtonStyle(
        surfaceTintColor: MaterialStatePropertyAll<Color>(Colors.transparent),
        shadowColor: MaterialStatePropertyAll<Color>(Colors.transparent),
        foregroundColor: MaterialStatePropertyAll<Color>(Colors.black),
        backgroundColor: MaterialStatePropertyAll<Color>(Colors.transparent),
        overlayColor: MaterialStatePropertyAll<Color>(Colors.transparent),
        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.zero
        )),
      ),
      onPressed: (){
        searchCategoryName.value = searchResult;
        searchPageScreenIndex.value = 2;
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const SizedBox(width: 10,),
              isHistory ? const Icon(Icons.history, color: Colors.grey,) : Container(),
              const SizedBox(width: 10,),
              Text( searchResult,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
          isHistory ? Container() : const Icon(Iconsax.arrow_right_3, size: 20,)
        ],
      ),
    ),
  );
}
