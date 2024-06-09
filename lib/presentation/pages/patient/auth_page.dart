import 'package:flutter/material.dart';
import 'package:medical_prescription/presentation/screens/patient/auth_screen.dart';
import 'package:medical_prescription/presentation/screens/patient/login_screen.dart';
import 'package:medical_prescription/presentation/screens/patient/sign_up_form_screen.dart';
import 'package:medical_prescription/presentation/screens/patient/sign_up_screen.dart';
import 'package:medical_prescription/presentation/screens/patient/verification_screen.dart';

final ValueNotifier authPageIndex = ValueNotifier(0);

class AuthPage extends StatefulWidget {
  AuthPage({Key? key}) : super(key: key);

  final List<Widget> screens = [
    const AuthScreen(),
    const LoginScreen(),
    // const SignUpScreen(),
    // const VerificationScreen(),
    const SignUpFormScreen()
  ];

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: authPageIndex,
      builder: (context, val, index){
        return widget.screens[authPageIndex.value];
      }
    );
  }
}