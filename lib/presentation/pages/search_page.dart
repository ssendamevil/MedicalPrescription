import 'package:flutter/material.dart';
import 'package:medical_prescription/presentation/screens/catalogue_screen.dart';
import 'package:medical_prescription/presentation/screens/search_screen.dart';

final ValueNotifier searchPageScreenIndex = ValueNotifier(0);

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  final List<Widget> screens = [
    CatalogueScreen(),
    const SearchScreen()
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
          return widget.screens[searchPageScreenIndex.value];
        }
    );
  }
}
