import 'package:flutter/material.dart';
import 'package:medical_prescription/presentation/screens/patient/faq_screen.dart';
import 'package:medical_prescription/presentation/screens/patient/orders_screen.dart';
import 'package:medical_prescription/presentation/screens/patient/profile_data_screen.dart';
import 'package:medical_prescription/presentation/screens/patient/profile_screen.dart';

final ValueNotifier profilePageIndex = ValueNotifier(0);

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  final List<Widget> screens = [
    const ProfileScreen(),
    const UserSettingsScreen(),
    const FAQScreen(),
    const OrdersScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ValueListenableBuilder(
        valueListenable: profilePageIndex,
        builder: (context, val, child){
          return screens.elementAt(profilePageIndex.value);
        },
      ),
    );
  }

}