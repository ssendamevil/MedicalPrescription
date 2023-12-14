import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_prescription/core/util/theme/Colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Color(0xffF0F0F0),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Profile",
            style: GoogleFonts.montserrat(
              textStyle: Theme.of(context).textTheme.headlineSmall
            ),
          ),
          backgroundColor: Colors.white,
          shape: Border(
              bottom: BorderSide(color: customBlack.shade100, width: 1)
          ),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 30,),
              Container(
                width: MediaQuery.of(context).size.width-20,
                height: 90,
                padding: const EdgeInsets.only(left: 10, right: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: customBlack.shade100,
                      offset: const Offset(0,0),
                      blurRadius: 0.0,
                      spreadRadius: 1.0,
                    ),
                  ]
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children:[
                        const SizedBox(width: 5,),
                        Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            color: customBlack.shade50,
                            borderRadius: BorderRadius.circular(100),
                          ),
                        ),
                        const SizedBox(width: 15,),
                        Text(
                          "Ali Orynbassarov",
                          style: GoogleFonts.montserrat(
                            textStyle: Theme.of(context).textTheme.headlineSmall,
                          ),
                        )
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_sharp,
                      size: 25,
                    )
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
