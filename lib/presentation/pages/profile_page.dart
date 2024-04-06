import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
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
        backgroundColor: MediaQuery.of(context).platformBrightness == Brightness.dark? Colors.black : const Color(0xffF0F0F0),
        appBar: AppBar(
          scrolledUnderElevation: 0,
          centerTitle: true,
          title: Text(
            "Profile",
            style: Theme.of(context).textTheme.headlineSmall
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
                      shadowColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                      backgroundColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                      surfaceTintColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                      overlayColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                    ),
                    onPressed: (){},
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
                              child: Icon(
                                Iconsax.user
                              ),
                            ),
                            const SizedBox(width: 15,),
                            Text(
                              "Ali Orynbassarov",
                              style: Theme.of(context).textTheme.headlineSmall
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
                  child: Column(
                    children: [
                      ElevatedButton(
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
                        onPressed: (){},
                        child: Row(
                          children: [
                            Icon(
                              Iconsax.location,
                              size: 27,
                              color: MediaQuery.of(context).platformBrightness == Brightness.dark? Colors.white : Colors.black,
                            ),
                            const SizedBox(width: 15,),
                            Text(
                              "Astana",
                              style: Theme.of(context).textTheme.titleMedium
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: customBlack.shade50
                        ),
                      ),
                      ElevatedButton(
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
                        onPressed: (){},
                        child: Row(
                          children: [
                            Icon(
                              Iconsax.bag_tick,
                              size: 27,
                              color: MediaQuery.of(context).platformBrightness == Brightness.dark? Colors.white : Colors.black,
                            ),
                            const SizedBox(width: 15,),
                            Text(
                              "Orders",
                              style: Theme.of(context).textTheme.titleMedium
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            color: customBlack.shade50
                        ),
                      ),
                      ElevatedButton(
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
                        onPressed: (){},
                        child: Row(
                          children: [
                            Icon(
                              Iconsax.task_square,
                              size: 27,
                              color: MediaQuery.of(context).platformBrightness == Brightness.dark? Colors.white : Colors.black,
                            ),
                            const SizedBox(width: 15,),
                            Text(
                              "User agreement",
                              style: Theme.of(context).textTheme.titleMedium
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            color: customBlack.shade50
                        ),
                      ),
                      ElevatedButton(
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
                        onPressed: (){},
                        child: Row(
                          children: [
                            Icon(
                              Iconsax.message_question,
                              size: 27,
                              color: MediaQuery.of(context).platformBrightness == Brightness.dark? Colors.white : Colors.black,
                            ),
                            const SizedBox(width: 15,),
                            Text(
                              "FAQ",
                              style: Theme.of(context).textTheme.titleMedium
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 1,
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            color: customBlack.shade50
                        ),
                      ),
                      ElevatedButton(
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
                        onPressed: (){},
                        child: Row(
                          children: [
                            Icon(
                              Iconsax.messages,
                              size: 27,
                              color: MediaQuery.of(context).platformBrightness == Brightness.dark? Colors.white : Colors.black,
                            ),
                            const SizedBox(width: 15,),
                            Text(
                              "Write to support",
                              style: Theme.of(context).textTheme.titleMedium
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
                      onPressed: (){},
                      child: Row(
                        children: [
                          const Icon(
                            Iconsax.logout,
                            size: 27,
                            color: Colors.red,
                          ),
                          const SizedBox(width: 15,),
                          Text(
                            "Log out",
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
