import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

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
      onPressed: (){},
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
