import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';

import '../app.dart';

class SignUpFormScreen extends StatefulWidget {
  const SignUpFormScreen({Key? key}) : super(key: key);

  @override
  State<SignUpFormScreen> createState() => _SignUpFormScreenState();
}

class _SignUpFormScreenState extends State<SignUpFormScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Sign Up", style: GoogleFonts.montserrat(fontWeight: FontWeight.w800, fontSize: 16),),
        centerTitle: true,
      ),
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30,),
              Text("Enter your credentials",
                style: GoogleFonts.montserrat(
                  fontSize: 18,
                  fontWeight: FontWeight.w700
                ),
              ),
              const SizedBox(height: 10,),
              Text("Create your new password to login", style: GoogleFonts.montserrat(color: const Color(0xff818181), fontWeight: FontWeight.w500, fontSize: 16),),
              const SizedBox(height: 60,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 56,
                    child: TextFormField(
                      style: GoogleFonts.montserrat(fontSize: 16),
                      decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: const Icon(Iconsax.user, color: Color(0xffA1A8B0), size: 21,),
                        hintText: "Enter your fullname",
                        hintStyle: GoogleFonts.montserrat(color: const Color(0xffA1A8B0), fontSize: 16),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: const BorderSide(color: Color(0xffE5E7EB),width: 1.0),
                        ),
                        filled: true,
                        fillColor: const Color(0xffF9FAFB),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: const BorderSide(color: Color(0xffE5E7EB),width: 1.0),
                        )
                      ),
                    ),

                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: 56,
                    child: TextFormField(
                      obscureText: true,
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
                          icon: const Icon(Iconsax.eye_slash, size: 21,color: Color(0xffA1A8B0),),
                          onPressed: (){},
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: const BorderSide(color: Color(0xffE5E7EB),width: 1.0),
                        ),
                        filled: true,
                        fillColor: const Color(0xffF9FAFB),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(18),
                          borderSide: const BorderSide(color: Color(0xffE5E7EB),width: 1.0),
                        )
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  SizedBox(
                    height: 56,
                    child: TextFormField(
                      obscureText: true,
                      obscuringCharacter: "*",
                      style: GoogleFonts.montserrat(fontSize: 16),
                      decoration: InputDecoration(
                          isDense: true,
                          prefixIcon: const Icon(Iconsax.lock_1, color: Color(0xffA1A8B0), size: 21,),
                          hintText: "Retype your password",
                          hintStyle: GoogleFonts.montserrat(color: const Color(0xffA1A8B0), fontSize: 16),
                          suffix: IconButton(
                            style: const ButtonStyle(
                                padding: MaterialStatePropertyAll(EdgeInsets.zero),
                                overlayColor: MaterialStatePropertyAll(Colors.transparent)
                            ),
                            icon: const Icon(Iconsax.eye_slash, size: 21,color: Color(0xffA1A8B0),),
                            onPressed: (){},
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: const BorderSide(color: Color(0xffE5E7EB),width: 1.0),
                          ),
                          filled: true,
                          fillColor: const Color(0xffF9FAFB),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: const BorderSide(color: Color(0xffE5E7EB),width: 1.0),
                          )
                      ),
                    ),
                  ),
                  const SizedBox(height: 60,),
                  SizedBox(
                    height: 54,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: const MaterialStatePropertyAll(Color(0xff07BEB8)),
                            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                            elevation: const MaterialStatePropertyAll(0),
                            foregroundColor: const MaterialStatePropertyAll(Colors.white),
                            shadowColor: const MaterialStatePropertyAll(Colors.transparent),
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)))
                        ),
                        onPressed: (){
                          isSigned.value = true;
                        },
                        child: Text(
                          "Sign Up",
                          style: GoogleFonts.montserrat(fontSize:18, fontWeight: FontWeight.w400),
                        )
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
