import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_prescription/presentation/bloc/prescription/prescription_bloc.dart';
import 'package:medical_prescription/presentation/components/appointment_section.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skeletonizer/skeletonizer.dart';


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
              AppLocalizations.of(context)!.treatment_title,
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
          builder: _stateBuilder,
        )
    );
  }

  Widget _stateBuilder(BuildContext context, PrescriptionState state) {
    return Skeletonizer(
      enabled: state.stateType == PrescriptionStateType.isLoading,
      child: SingleChildScrollView(
        child: Column(
          children: [
              AppointmentSection(sectionName: "Active",
                prstns: state.activePrescriptions,),
              AppointmentSection(sectionName: "Realized",
                  prstns: state.handedPrescriptions),
              AppointmentSection(sectionName: "Expired",
                  prstns: state.expiredPrescriptions)
          ],
        ),
      ),
    );
  }
}