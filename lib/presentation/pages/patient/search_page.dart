import 'package:flutter/material.dart';
import 'package:medical_prescription/domain/entities/cart/cart.dart';
import 'package:medical_prescription/domain/entities/medicament/medicament.dart';
import 'package:medical_prescription/presentation/screens/patient/catalogue_screen.dart';
import 'package:medical_prescription/presentation/screens/patient/search_result_screen.dart';
import 'package:medical_prescription/presentation/screens/patient/search_screen.dart';

final ValueNotifier searchPageScreenIndex = ValueNotifier(0);
final ValueNotifier searchCategoryName = ValueNotifier("");
final ValueNotifier searchResultList = ValueNotifier([]);

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  final List<Widget> screens = [
    CatalogueScreen(),
    const SearchScreen(),
    SearchResultScreen()
  ];

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: searchPageScreenIndex,
        builder: (context,val, child){
          return SafeArea(child: widget.screens[searchPageScreenIndex.value]);
        }
    );
  }
}