import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/core/util/theme/Colors.dart';
import 'package:medical_prescription/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:medical_prescription/presentation/pages/patient/auth_page.dart';
import 'package:medical_prescription/presentation/pages/patient/profile_page.dart';
import 'package:medical_prescription/presentation/screens/patient/patient_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String imageAddress = "assets/images/profile.jpeg";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: MediaQuery.of(context).platformBrightness == Brightness.dark? Colors.black : const Color(0xffF0F0F0),
        appBar: AppBar(
          scrolledUnderElevation: 0,
          centerTitle: true,
          title: Text(
            AppLocalizations.of(context)!.navbar_item_profile,
          ),
          shape: Border(
              bottom: BorderSide(color: customBlack.shade100, width: 1)
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 30,),
                Container(
                    width: MediaQuery.of(context).size.width-20,
                    height: 90,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: MediaQuery.of(context).platformBrightness == Brightness.dark? Colors.black : Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: customBlack.shade100,
                            offset: const Offset(0,0),
                            blurRadius: 0.0,
                            spreadRadius: 1.0,
                          ),
                        ]
                    ),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )
                        ),
                        foregroundColor: const MaterialStatePropertyAll(Colors.black),
                        shadowColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                        backgroundColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                        surfaceTintColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                        overlayColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                      ),
                      onPressed: (){
                        profilePageIndex.value = 1;
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children:[
                              const SizedBox(width: 5,),
                              imageAddress.isNotEmpty?
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(imageAddress),
                                  ) :
                                  Container(
                                    width: 60,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: customBlack.shade50,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: const Icon(
                                        Iconsax.user,
                                      color: Colors.grey,
                                    ),
                                  ),
                              const SizedBox(width: 15,),
                              Text(
                                  "Ali Orynbassarov",
                                style: GoogleFonts.montserrat(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w600
                                ),
                              )
                            ],
                          ),
                          const Icon(
                            Icons.arrow_forward_ios_sharp,
                            size: 25,
                          )
                        ],
                      ),
                    )
                ),
                const SizedBox(height: 20,),
                Container(
                  width: MediaQuery.of(context).size.width-20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: MediaQuery.of(context).platformBrightness == Brightness.dark? Colors.black : Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: customBlack.shade100,
                          offset: const Offset(0,0),
                          blurRadius: 0.0,
                          spreadRadius: 1.0,
                        ),
                      ]
                  ),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      padding: const MaterialStatePropertyAll<EdgeInsetsGeometry>(EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0.0),
                        ),
                      ),
                      shadowColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                      backgroundColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                      surfaceTintColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                      overlayColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                    ),
                    onPressed: ()=> _dialogBuilder(context),
                    child: Row(
                      children: [
                        const Icon(
                          Iconsax.logout,
                          size: 27,
                          color: Colors.red,
                        ),
                        const SizedBox(width: 15,),
                        Text(
                          AppLocalizations.of(context)!.profile_table_items_logout,
                          style: GoogleFonts.exo2(
                              textStyle: Theme.of(context).textTheme.titleMedium,
                              color: Colors.red
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Future <void> _dialogBuilder(BuildContext context){
  AuthBloc authBloc = context.read<AuthBloc>();
  return showDialog<void>(context: context,
      builder: (BuildContext context){
        return AlertDialog(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          content: SizedBox(
            height: 400,
            child: Column(
              children: [
                const SizedBox(height: 40,),
                Image.asset("assets/icons/logout.png"),
                const SizedBox(height: 40,),
                Text("Are you sure to log out of your account?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w700,
                      fontSize: 18.0
                  ),
                ),
                const SizedBox(height: 20,),
                SizedBox(
                  width: 240,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                      selectedIndexGlobal.value=0;
                      authPageIndex.value = 0;
                      authBloc.add(AuthLogoutEvent());
                    },
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                        )
                      ),
                      surfaceTintColor: const MaterialStatePropertyAll(Colors.black),
                      backgroundColor: const MaterialStatePropertyAll(Color(0xff199A8E)),
                      foregroundColor: const MaterialStatePropertyAll(Colors.white),
                      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                      textStyle: MaterialStatePropertyAll(GoogleFonts.montserrat(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 16)),
                    ),
                    child: Text(
                        AppLocalizations.of(context)!.profile_table_items_logout
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                TextButton(
                  onPressed: (){
                    Navigator.of(context).pop();
                  },
                  style: ButtonStyle(
                    foregroundColor: const MaterialStatePropertyAll(Color(0xff199A8E)),
                    textStyle: MaterialStatePropertyAll(GoogleFonts.montserrat(fontWeight: FontWeight.w600, fontSize: 16)),
                    surfaceTintColor: const MaterialStatePropertyAll(Colors.black),
                    overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                  ),
                  child: const Text(
                      "Cancel"
                  ),
                )
              ],
            ),
          ),
        );
      }
  );
}
