import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/presentation/pages/patient/auth_page.dart';
import 'package:toastification/toastification.dart';
import '../../bloc/auth_bloc/auth_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthBloc _authBloc;
  late TextEditingController _usernameController;
  late TextEditingController _iinController;
  late TextEditingController _passwordController;

  bool obscuredText1 = true;

  @override
  void initState() {
    super.initState();
    _authBloc =context.read<AuthBloc>();
    _usernameController = TextEditingController();
    _iinController = TextEditingController();
    _passwordController = TextEditingController();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            setState(() {
              authPageIndex.value=0;
            });
          },
          icon: const Icon(Iconsax.arrow_left),
        ),
        title: Text("Login", style: GoogleFonts.montserrat(fontWeight: FontWeight.w500, fontSize: 16),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30,),
            Image.asset("assets/logos/app-logo.png", height: 100,),
            const SizedBox(height: 10,),
            Text("Login in Medics",
              style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w700
              ),
            ),
            const SizedBox(height: 20,),
            BlocBuilder<AuthBloc, AuthState>(
              builder: _stateBuilder,
            ),
            BlocListener<AuthBloc, AuthState>(
              listener: _stateListener,
              child: Container(),
            )
          ],
        )
      ),
    );
  }

  Widget _stateBuilder(BuildContext context, AuthState state){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 54,
          child: TextFormField(
            controller: _usernameController,
            style: GoogleFonts.montserrat(fontSize: 16),
            decoration: InputDecoration(
                isDense: true,
                prefixIcon: const Icon(Iconsax.user, color: Color(0xffA1A8B0), size: 21,),
                hintText: "Enter your username",
                hintStyle: GoogleFonts.montserrat(color: const Color(0xffA1A8B0), fontSize: 16),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xffE5E7EB),width: 1.0),
                ),
                filled: true,
                fillColor: const Color(0xffF9FAFB),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xffE5E7EB),width: 1.0),
                )
            ),
          ),
        ),
        const SizedBox(height: 10,),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 54,
          child: TextFormField(
            keyboardType: TextInputType.number,
            controller: _iinController,
            style: GoogleFonts.montserrat(fontSize: 16),
            decoration: InputDecoration(
                isDense: true,
                prefixIcon: const Icon(Iconsax.user, color: Color(0xffA1A8B0), size: 21,),
                hintText: "Enter your IIN",
                hintStyle: GoogleFonts.montserrat(color: const Color(0xffA1A8B0), fontSize: 16),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xffE5E7EB),width: 1.0),
                ),
                filled: true,
                fillColor: const Color(0xffF9FAFB),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xffE5E7EB),width: 1.0),
                )
            ),
          ),
        ),
        const SizedBox(height: 10,),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 54,
          child: TextFormField(
            controller: _passwordController,
            obscureText: obscuredText1,
            obscuringCharacter: "*",
            style: GoogleFonts.montserrat(fontSize: 16),
            decoration: InputDecoration(
                isDense: true,
                prefixIcon: const Icon(Iconsax.lock_1, color: Color(0xffA1A8B0), size: 21,),
                hintText: "Enter your password",
                hintStyle: GoogleFonts.montserrat(color: const Color(0xffA1A8B0), fontSize: 16),
                suffix: IconButton(
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.zero),
                      overlayColor: MaterialStatePropertyAll(Colors.transparent)
                  ),
                  icon: obscuredText1? const Icon(Iconsax.eye_slash, size: 21,color: Color(0xffA1A8B0),) : const Icon(Iconsax.eye, size: 21,color: Color(0xffA1A8B0),),
                  onPressed: (){
                    setState(() {
                      obscuredText1 = !obscuredText1;
                    });
                  },
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xffE5E7EB),width: 1.0),
                ),
                filled: true,
                fillColor: const Color(0xffF9FAFB),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Color(0xffE5E7EB),width: 1.0),
                )
            ),
          ),
        ),
        const SizedBox(height: 30,),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 54,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: const MaterialStatePropertyAll(Color(0xff199A8E)),
                  overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                  elevation: const MaterialStatePropertyAll(0),
                  foregroundColor: const MaterialStatePropertyAll(Colors.white),
                  shadowColor: const MaterialStatePropertyAll(Colors.transparent),
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))
              ),
              onPressed: (){
                _authBloc.add(AuthLoginEvent(_usernameController.text, _passwordController.text));
              },
              child: Text(
                "Login",
                style: GoogleFonts.montserrat(fontSize:16, fontWeight: FontWeight.w400),
              )
          ),
        ),
      ],
    );
  }

  void _stateListener(BuildContext context, AuthState state) {
    if (state.stateType == AuthStateType.failure) {
      toastification.show(
        title: Text(state.error.msg),
        autoCloseDuration: const Duration(seconds: 5),
        style: ToastificationStyle.fillColored,
        type: ToastificationType.error
      );
    }
  }
}
