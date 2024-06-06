import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_prescription/presentation/screens/patient/patient_app.dart';
import 'package:medical_prescription/presentation/widgets/shimmer_box.dart';
import '../../../core/util/theme/Colors.dart';
import '../../widgets/section_labels.dart';
import '../../pages/patient/search_page.dart';
import '../../components/slider_banner.dart';
import '../../components/slider_prescription.dart';
import '../../components/recent_order_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(84),
          child: AppBar(
            scrolledUnderElevation: 0,
            shadowColor: Colors.transparent,
            shape: const Border(
                bottom: BorderSide(color: Colors.black12, width: 1)
            ),
            flexibleSpace: Container(
              margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width-40.0,
                    height: 44,
                    child: OutlinedButton(
                      onPressed: (){
                        selectedIndexGlobal.value = 1;
                        searchPageScreenIndex.value = 1;
                      },
                      style: ButtonStyle(
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )
                        ),
                        shadowColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                        overlayColor: const MaterialStatePropertyAll(Colors.transparent),
                        iconColor: MaterialStatePropertyAll<Color>(customBlack.shade200),
                        backgroundColor: const MaterialStatePropertyAll<Color>(Color(0xffFBFBFB)),
                      ),
                      child: Row(
                        children: [
                          const Icon(CupertinoIcons.search),
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
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: isLoading ? const Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ShimmerBox(height: 190, width: 0, borderRadius: 10,),
                  SizedBox(height: 12,),
                  ShimmerBox(height: 12, width: 80, borderRadius: 10,),
                  SizedBox(height: 25,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerBox(height: 20, width: 210, borderRadius: 10,),
                      ShimmerBox(height: 20, width: 70, borderRadius: 10,),
                    ],
                  ),
                  SizedBox(height: 25,),
                  ShimmerBox(height: 180, width: 0, borderRadius: 10,),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ShimmerBox(height: 20, width: 170, borderRadius: 10,),
                      ShimmerBox(height: 20, width: 70, borderRadius: 10,),
                    ],
                  ),
                  SizedBox(height: 30,),
                  ShimmerBox(height: 180, width: 0, borderRadius: 10,)
                ],
              ),
            ),
          ) :
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 15,),
                const SliderBanner(),
                const SizedBox(height: 15,),
                sectionLabels(context, "My last prescriptions", true, 2),
                const SliderPrescriptions(),
                const SizedBox(height: 20,),
                sectionLabels(context, "Recent Orders", true, 4),
                const RecentOrderSlider(),
                const SizedBox(height: 40,),
                sectionLabels(context, "Map of pharmacies", false, 0),
                const SizedBox(height: 20),
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width-40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    child: Container()
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
