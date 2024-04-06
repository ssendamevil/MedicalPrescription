import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/core/util/theme/AppTheme.dart';
import 'package:medical_prescription/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:medical_prescription/presentation/pages/appointment_page.dart';
import 'package:medical_prescription/presentation/pages/cart_page.dart';
import 'package:medical_prescription/presentation/pages/home_page.dart';
import 'package:medical_prescription/presentation/pages/profile_page.dart';
import 'package:medical_prescription/presentation/pages/search_page.dart';

final ValueNotifier selectedIndexGlobal = ValueNotifier(0);
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchBloc>(
            create: (context) => SearchBloc()
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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: ValueListenableBuilder(
        valueListenable: selectedIndexGlobal,
        builder: (context,val, child){
          return Scaffold(
            body: <Widget>[
              HomePage(),
              SearchPage(),
              const AppointmentPage(),
              const CartPage(),
              const ProfilePage(),
            ][selectedIndexGlobal.value],
            bottomNavigationBar: Container(
              height: 60,
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
                  items: const <BottomNavigationBarItem>[
                    BottomNavigationBarItem(
                        icon: Icon(Iconsax.home),
                        label: 'Home'
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Iconsax.search_normal),
                        label: 'Search'
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Iconsax.document),
                        label: 'Appointment'
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Iconsax.bag),
                        label: 'Cart'
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Iconsax.profile_circle),
                        label: 'Profile'
                    )
                  ],
                ),
              ),
            ),
          );
        },
      )
    );
  }
}

