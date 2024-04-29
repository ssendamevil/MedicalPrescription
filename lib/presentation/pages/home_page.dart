import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_prescription/presentation/screens/home_screen.dart';
import 'package:medical_prescription/presentation/screens/map_screen.dart';

final ValueNotifier homePageIndex = ValueNotifier(0);

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Widget> screens = [
    const HomeScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ValueListenableBuilder(
          valueListenable: homePageIndex,
          builder: (context,val, child){
            return screens.elementAt(homePageIndex.value);
          }
      ),
    );
  }
}
