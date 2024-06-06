import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medical_prescription/presentation/bloc/prescription/prescription_bloc.dart';
import 'package:medical_prescription/presentation/components/appointment_section.dart';
import 'package:medical_prescription/presentation/widgets/shimmer_box.dart';


class AppointmentPage extends StatefulWidget {
  const AppointmentPage({Key? key}) : super(key: key);

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  late PrescriptionBloc _prescriptionBloc;

  @override
  void initState() {
    _prescriptionBloc = context.read<PrescriptionBloc>();
    _prescriptionBloc.add(GetAllPrscrpEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(75),
          child: AppBar(
            backgroundColor: const Color(0xff199A8E),
            scrolledUnderElevation: 0,
            title: Text(
              "Treatment Scheme",
              style: GoogleFonts.montserrat(
                // fontSize: 18.0,
                // fontWeight: FontWeight.w700,
                  color: Colors.white
              ),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30)
                )
            ),
            centerTitle: true,
          ),
        ),
        body: BlocBuilder<PrescriptionBloc, PrescriptionState>(
          builder: (context, state) {
            if(state.stateType == PrescriptionStateType.success){
              if(state.activePrescriptions.isEmpty && state.inactivePrescriptions.isEmpty && state.expiredPrescriptions.isEmpty && state.handedPrescriptions.isEmpty){
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("assets/icons/Prescription_emptystate.png", height: 200, width: 250,),
                      Text("There is no prescriptions",
                        style: GoogleFonts.montserrat(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                );
              }else {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      if(state.activePrescriptions.isNotEmpty)
                        AppointmentSection(sectionName: "Active",
                          prstns: state.activePrescriptions,),
                      if(state.handedPrescriptions.isNotEmpty)
                        AppointmentSection(sectionName: "Realized",
                            prstns: state.handedPrescriptions),
                      if(state.expiredPrescriptions.isNotEmpty)
                        AppointmentSection(sectionName: "Expired",
                            prstns: state.expiredPrescriptions)
                    ],
                  ),
                );
              }
            }else if(state.stateType == PrescriptionStateType.isLoading){
              return const Padding(
                padding: EdgeInsets.only(left: 20.0, top: 20, right: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerBox(height: 30, width: 150, borderRadius: 10,),
                      SizedBox(height: 20,),
                      ShimmerBox(height: 350, width: 0, borderRadius: 10,),
                      SizedBox(height: 15,),
                      ShimmerBox(height: 30, width: 150, borderRadius: 10,),
                      SizedBox(height: 20,),
                      ShimmerBox(height: 180, width: 0, borderRadius: 10,),
                    ],
                  ),
                ),
              );
            }else{
              return Center(
                child: Container(
                  child: Text(
                    "Internal server error: 500!",
                    style: GoogleFonts.montserrat(
                      fontSize: 16.0,
                      color: Colors.grey
                    ),
                  ),
                ),
              );
            }
          },
        )
    );
  }
}