import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_prescription/core/util/theme/Colors.dart';
import 'package:medical_prescription/presentation/app.dart';
import 'package:medical_prescription/presentation/components/Labels.dart';
import 'package:medical_prescription/presentation/pages/search_page.dart';
import 'package:medical_prescription/presentation/screens/home_screen.dart';
import 'package:medical_prescription/presentation/screens/map_screen.dart';
import 'package:medical_prescription/presentation/widgets/carousel_banner.dart';
import 'package:medical_prescription/presentation/widgets/carousel_prescription.dart';
import 'package:medical_prescription/presentation/widgets/recent_order_slider.dart';

final ValueNotifier homePageIndex = ValueNotifier(1);

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Widget> screens = [
    const HomeScreen(),
    const MapScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: homePageIndex,
        builder: (context,val, child){
          return screens.elementAt(homePageIndex.value);
        }
    );
  }
}
