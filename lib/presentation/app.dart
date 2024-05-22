import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/core/util/theme/AppTheme.dart';
import 'package:medical_prescription/presentation/bloc/catalogue_bloc/catalogue_bloc.dart';
import 'package:medical_prescription/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:medical_prescription/presentation/pages/appointment_page.dart';
import 'package:medical_prescription/presentation/pages/auth_page.dart';
import 'package:medical_prescription/presentation/pages/cart_page.dart';
import 'package:medical_prescription/presentation/pages/home_page.dart';
import 'package:medical_prescription/presentation/pages/profile_page.dart';
import 'package:medical_prescription/presentation/pages/search_page.dart';

import 'bloc/cart_bloc/cart_bloc.dart';

final ValueNotifier selectedIndexGlobal = ValueNotifier(0);
final ValueNotifier isSigned = ValueNotifier(true);
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchBloc>(
            create: (context) => SearchBloc()
        ),
        BlocProvider<CatalogueBloc>(
          create: (context) => CatalogueBloc(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(),
        )
      ],
      child: const AppView()
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late CartBloc cartBloc;
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: ValueListenableBuilder(
        valueListenable: isSigned,
          builder: (context,val, child) => _checkIfAuth()
      )
    );
  }

  Widget _checkIfAuth(){
    if(!isSigned.value){
      return const AuthPage();
    }else{
      return ValueListenableBuilder(
        valueListenable: selectedIndexGlobal,
        builder: (context,val, child){
          return Scaffold(
            body: <Widget>[
              HomePage(),
              SearchPage(),
              const AppointmentPage(),
              const CartPage(),
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
                    const BottomNavigationBarItem(
                      icon: SizedBox(height: 24, child: Icon(Iconsax.home)),
                      label: 'Home'
                    ),
                    const BottomNavigationBarItem(
                      icon: SizedBox(height: 24,width: 70, child: Icon(Iconsax.search_normal)),
                      label: 'Search'
                    ),
                    const BottomNavigationBarItem(
                      icon: SizedBox(height: 24, child: Icon(Iconsax.document)),
                      label: 'Appointment'
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
                                state.cartItems.isNotEmpty?
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
                                    child: Text('${state.cartItems.length}',
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
                      label: 'Cart'
                    ),
                    const BottomNavigationBarItem(
                      icon: SizedBox(height: 24, child: Icon(Iconsax.profile_circle)),
                      label: 'Profile'
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    }
  }
}

