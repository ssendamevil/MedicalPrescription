import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_prescription/domain/entities/prescription.dart';
import 'package:medical_prescription/presentation/bloc/prescription/prescription_bloc.dart';
import 'package:medical_prescription/presentation/components/appointment_cards_item.dart';


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
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15, right: 25, left: 25, bottom: 0),
                      child: Row(
                        children: [
                          Text(
                            "Active",
                            style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Text('${state.prscps.length}',
                            style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff999999)
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        height: 550,
                        color: Colors.transparent,
                        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                        child: ListView.separated(
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return AppointmentCardsItem(prescriptionEntity: state.prscps.elementAt(index) );
                            },
                            separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 20,),
                            itemCount: state.prscps.length
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, right: 25, left: 25, bottom: 0),
                      child: Row(
                        children: [
                          Text(
                            "Realized",
                            style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Text("1",
                            style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff999999)
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        height: 260,
                        color: Colors.transparent,
                        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                        child: ListView.separated(
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return AppointmentCardsItem(
                                prescriptionEntity: PrescriptionEntity(
                                  appointmentState: "Realized",
                                  expirationDate: DateTime(2023),
                                  issueDate: DateTime(2022),
                                  activeIngredients: const ["Пасиреотид", "Октреотид"],
                                  doctorId: 45894,
                                  patientId: 564846,
                                  id: 184515,
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 20,),
                            itemCount: 1
                        )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, right: 25, left: 25, bottom: 0),
                      child: Row(
                        children: [
                          Text(
                            "Expired",
                            style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                            ),
                          ),
                          const SizedBox(width: 10,),
                          Text("1",
                            style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff999999)
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                        height: 260,
                        color: Colors.transparent,
                        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                        child: ListView.separated(
                            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return AppointmentCardsItem(
                                prescriptionEntity: PrescriptionEntity(
                                  appointmentState: "Expired",
                                  expirationDate: DateTime(2023),
                                  issueDate: DateTime(2023),
                                  activeIngredients: const ["L-лизина эсцинат", "инозитол"],
                                  doctorId: 45894,
                                  patientId: 564846,
                                  id: 184515,
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) => const SizedBox(width: 20,),
                            itemCount: 1
                        )
                    ),
                  ],
                ),
              );
            }else if(state.stateType == PrescriptionStateType.isLoading){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }else{
              return Container();
            }
          },
        )
    );
  }
}