import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_prescription/domain/entities/prescription/prescription.dart';
import 'package:medical_prescription/presentation/bloc/medicament/medicament_bloc.dart';
import 'package:medical_prescription/presentation/pages/patient/search_page.dart';
import 'package:medical_prescription/presentation/screens/patient/patient_app.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PrescriptionScreen extends StatefulWidget {
  const PrescriptionScreen({Key? key, required this.prescriptionEntity}) : super(key: key);
  final PrescriptionEntity prescriptionEntity;

  @override
  State<PrescriptionScreen> createState() => _PrescriptionScreenState();
}

class _PrescriptionScreenState extends State<PrescriptionScreen> {
  late MedicamentBloc _medicamentBloc;
  final GlobalKey globalKey = GlobalKey();
  String qrData = "SampleData1";

  @override
  void initState() {
    _medicamentBloc = context.read<MedicamentBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          AppLocalizations.of(context)!.prescription_title,
        ),
        backgroundColor: const Color(0xff199A8E),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 120.0,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xff199A8E),
              child: Column(
                children: [
                  const Text("№1784554884"),
                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text(
                        AppLocalizations.of(context)!.expiration_status('10'),
                        style: GoogleFonts.montserrat(
                            textStyle: Theme.of(context).textTheme.labelMedium,
                            color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 270,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: const Color(0xffAAAAAA))
                        ),
                        child: LayoutBuilder(
                          builder: (BuildContext context, BoxConstraints constraints) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 50,
                                  width: double.maxFinite,
                                  alignment: Alignment.centerLeft,
                                  padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(20), bottom: Radius.circular(0)),
                                  ),
                                  child: Text(
                                    widget.prescriptionEntity.activeIngredients.elementAt(0).name,
                                    style: GoogleFonts.montserrat(
                                        color: Colors.white,
                                        textStyle: Theme.of(context).textTheme.titleLarge
                                    ),
                                  ),
                                ),
                                Container(
                                  width: double.maxFinite,
                                  height: constraints.maxHeight-50,
                                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.vertical(top: Radius.circular(0), bottom: Radius.circular(20)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(AppLocalizations.of(context)!.presc_type,
                                            style: GoogleFonts.montserrat(
                                                textStyle: Theme.of(context).textTheme.bodySmall,
                                                color: Colors.grey
                                            ),
                                          ),
                                          const SizedBox(height: 5,),
                                          Text("Sublingual tablets", style: Theme.of(context).textTheme.titleLarge,),
                                          const SizedBox(height: 20,),
                                          Text(AppLocalizations.of(context)!.product_dosage,
                                            style: GoogleFonts.montserrat(
                                                textStyle: Theme.of(context).textTheme.bodySmall,
                                                color: Colors.grey
                                            ),
                                          ),
                                          const SizedBox(height: 5,),
                                          Text("100 mg", style: GoogleFonts.montserrat(fontSize: 14, fontWeight: FontWeight.w700)),
                                        ],
                                      ),
                                      Center(child:
                                      SizedBox(
                                        width: 270,
                                        height: 50,
                                        child: ElevatedButton(
                                            onPressed: (){
                                              Navigator.of(context).pop();
                                              selectedIndexGlobal.value = 1;
                                              searchPageScreenIndex.value = 2;
                                              searchResultList.value = [];
                                              searchCategoryName.value = "By Prescription";
                                              _medicamentBloc.add(GetMedicsByTagIdEvent(widget.prescriptionEntity.activeIngredients.elementAt(0).id));
                                            },
                                            style: ButtonStyle(
                                                surfaceTintColor: const MaterialStatePropertyAll<Color>(Colors.black),
                                                shadowColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                                                backgroundColor: const MaterialStatePropertyAll<Color>(Color(0xff199A8E)),
                                                overlayColor: const MaterialStatePropertyAll<Color>(Colors.transparent),
                                                shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)))
                                            ),
                                            child: Text( AppLocalizations.of(context)!.presc_btn('899') ,
                                              style: GoogleFonts.montserrat(
                                                  fontSize: 16,
                                                  color: Colors.white
                                              ),
                                            )
                                        ),
                                      )
                                      )
                                    ],
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15,),
                    itemCount: 2,
                  ),
                  const SizedBox(height: 50,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.presc_dis_doc,
                          style: Theme.of(context).textTheme.headlineSmall
                      ),
                      const SizedBox(height: 15,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Berikov Berik Berikulu", style: Theme.of(context).textTheme.titleLarge),
                              Text("Dermatovenerologist", style: GoogleFonts.montserrat(textStyle: Theme.of(context).textTheme.bodyMedium, color: Colors.grey),),
                              Text("Сity polyclinic No. 4", style: GoogleFonts.montserrat(textStyle: Theme.of(context).textTheme.bodyMedium, fontWeight: FontWeight.w600),),
                            ],
                          ),
                          IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.phone_in_talk, color: Colors.grey,size: 25,),
                            style: ButtonStyle(
                                padding: const MaterialStatePropertyAll(EdgeInsets.all(12)),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: const BorderSide(color: Colors.grey, width: 2)
                                    )
                                )
                            ),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
