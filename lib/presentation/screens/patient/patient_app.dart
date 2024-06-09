import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/data/data_sources/local/hive/box_helper.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../bloc/cart_bloc/cart_bloc.dart';
import '../../pages/patient/appointment_page.dart';
import '../../pages/patient/cart_page.dart';
import '../../pages/patient/home_page.dart';
import '../../pages/patient/profile_page.dart';
import '../../pages/patient/search_page.dart';


final ValueNotifier selectedIndexGlobal = ValueNotifier(0);

class PatientApp extends StatefulWidget {
  const PatientApp({Key? key}) : super(key: key);

  @override
  State<PatientApp> createState() => _PatientAppState();
}

class _PatientAppState extends State<PatientApp> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedIndexGlobal,
      builder: (context,val, child){
        return SafeArea(
          child: Scaffold(
            body: <Widget>[
              HomePage(),
              SearchPage(),
              const AppointmentPage(),
              CartPage(),
              ProfilePage(),
            ][selectedIndexGlobal.value],
            bottomNavigationBar: Container(
              height: 65,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15), topLeft: Radius.circular(15)),
                boxShadow: [
                  BoxShadow(color: Color(0xffB1B0B0), spreadRadius: 0, blurRadius: 4),
                ],
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
                child: BottomNavigationBar(
                  backgroundColor: Colors.white,
                  onTap: (int index) {
                    setState(() {
                      selectedIndexGlobal.value = index;
                      if(index == 1){
                        searchPageScreenIndex.value = 0;
                      }
                    });
                  },
                  currentIndex: selectedIndexGlobal.value,
                  selectedItemColor: const Color(0xff04726E),
                  unselectedItemColor: const Color(0xffA5A5A5),
                  showUnselectedLabels: true,
                  type: BottomNavigationBarType.fixed,
                  selectedLabelStyle: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      textStyle: const TextStyle(
                          overflow: TextOverflow.visible
                      )
                  ),
                  unselectedLabelStyle: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w600,
                      fontSize: 10,
                      textStyle: const TextStyle(
                          overflow: TextOverflow.visible
                      )
                  ),
                  iconSize: 20,
                  elevation: 0,
                  items: <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: const SizedBox(height: 24, child: Icon(Iconsax.home)),
                        label: AppLocalizations.of(context)!.navbar_item_home
                    ),
                    BottomNavigationBarItem(
                        icon: const SizedBox(height: 24,width: 70, child: Icon(Iconsax.search_normal)),
                        label: AppLocalizations.of(context)!.navbar_item_search
                    ),
                    BottomNavigationBarItem(
                        icon: const SizedBox(height: 24, child: Icon(Iconsax.document)),
                        label: AppLocalizations.of(context)!.navbar_item_appointment
                    ),
                    BottomNavigationBarItem(
                        icon: BlocBuilder<CartBloc, CartState>(
                          builder: (context, state) {
                            return SizedBox(
                              width: 40,
                              height: 24,
                              child: Stack(
                                children: [
                                  const Align(
                                      alignment: Alignment.center,
                                      child: Icon(Iconsax.bag)
                                  ),
                                  BoxHelper.getCart()!.isNotEmpty?
                                  Positioned(
                                    top: 0,
                                    right: 0,
                                    child: Container(
                                      width: 17,
                                      height: 17,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(50)
                                      ),
                                      child: Text('${BoxHelper.getCart()!.length}',
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.montserrat(
                                            color: Colors.white,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w600
                                        ),
                                      ),
                                    ),
                                  ) : Container()
                                ],
                              ),
                            );
                          },
                        ),
                        label: AppLocalizations.of(context)!.navbar_item_cart
                    ),
                    BottomNavigationBarItem(
                        icon: const SizedBox(height: 24, child: Icon(Iconsax.profile_circle)),
                        label: AppLocalizations.of(context)!.navbar_item_profile
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
