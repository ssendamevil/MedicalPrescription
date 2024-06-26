import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medical_prescription/presentation/screens/patient/home_screen.dart';
import 'package:medical_prescription/presentation/screens/patient/map_screen.dart';

final ValueNotifier homePageIndex = ValueNotifier(0);

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Widget> screens = [
    const HomeScreen(),
    const MapScreen()
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