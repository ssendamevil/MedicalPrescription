import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_prescription/core/util/theme/Colors.dart';
import 'package:medical_prescription/presentation/app.dart';
import 'package:medical_prescription/presentation/pages/search_page.dart';
import 'package:medical_prescription/presentation/widgets/carousel_banner.dart';
import 'package:medical_prescription/presentation/widgets/carousel_prescription.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            shadowColor: Colors.transparent,
            backgroundColor: Colors.white,
            shape: const Border(
              bottom: BorderSide(color: Colors.black12, width: 1)
            ),
            flexibleSpace: Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width-40.0,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: (){
                        selectedIndexGlobal.value = 1;
                        searchPageScreenIndex.value = 1;
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            )
                        ),
                        shadowColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                        iconColor: MaterialStatePropertyAll<Color>(customBlack.shade200),
                        backgroundColor: const MaterialStatePropertyAll<Color>(Color(0xffEEEDED)),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.search),
                          const SizedBox(width: 10,),
                          Text(
                            "Search in pharmacies of the city",
                            style: GoogleFonts.montserrat(
                              textStyle: Theme.of(context).textTheme.titleSmall,
                              color: customBlack.shade300
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            // decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //         begin: Alignment.topCenter,
            //         end: Alignment.bottomCenter,
            //         colors: <Color>[
            //           Color(0xff069893),
            //           Color(0xffffffff)
            //         ],
            //         tileMode: TileMode.mirror
            //     )
            // ),
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 30,),
                  SliderBanner(),
                  const SizedBox(height: 50,),
                  const SliderPrescriptions(),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}
