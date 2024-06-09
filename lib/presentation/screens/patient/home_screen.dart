import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical_prescription/presentation/bloc/order/order_bloc.dart';
import 'package:medical_prescription/presentation/bloc/prescription/prescription_bloc.dart';
import 'package:medical_prescription/presentation/screens/patient/patient_app.dart';
import 'package:medical_prescription/presentation/widgets/shimmer_box.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
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
  late PrescriptionBloc _prescriptionBloc;
  late OrderBloc _orderBloc;
  bool isLoading = false;
  late final YandexMapController _mapController;
  CameraPosition? _userLocation;
  var _mapZoom = 0.0;
  
  @override
  void initState() {
    _prescriptionBloc = context.read<PrescriptionBloc>();
    _orderBloc = context.read<OrderBloc>();
    _prescriptionBloc.add(GetAllPrscrpEvent());
    _orderBloc.add(GetAllOrdersByPatientEvent());
    super.initState();
  }

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
                            AppLocalizations.of(context)!.label_search_home,
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 15,),
                const SliderBanner(),
                const SizedBox(height: 15,),
                BlocBuilder<PrescriptionBloc, PrescriptionState>(
                  builder: (context, state) {
                    if(state.stateType == PrescriptionStateType.isLoading){
                      return Skeletonizer(
                          enabled: state.stateType == PrescriptionStateType.isLoading,
                          child: Column(
                            children: [
                              sectionLabels(context, AppLocalizations.of(context)!.label_recent_orders, true, 4),
                              const SizedBox(height: 15,),
                              const ShimmerBox(height: 200, width: 0, borderRadius: 10)
                            ],
                          )
                      );
                    }else {
                      return Skeletonizer(
                          enabled: state.stateType == PrescriptionStateType.isLoading,
                          child: Column(
                            children: [
                              sectionLabels(context, AppLocalizations.of(context)!.label_my_last_pres, true, 2),
                              SliderPrescriptions(prescs: state.prscps,),
                            ],
                          )
                      );
                    }
                  },
                ),
                const SizedBox(height: 20,),
                BlocBuilder<OrderBloc, OrderState>(
                  builder: (context, state) {
                    if(state.stateType == OrderStateType.isLoading){
                      return Skeletonizer(
                          enabled: state.stateType == OrderStateType.isLoading,
                          child: Column(
                            children: [
                              sectionLabels(context, AppLocalizations.of(context)!.label_recent_orders, true, 4),
                              const SizedBox(height: 15,),
                              const ShimmerBox(height: 200, width: 0, borderRadius: 10)
                            ],
                          )
                      );
                    }else {
                      return Skeletonizer(
                          enabled: state.stateType == OrderStateType.isLoading,
                          child: Column(
                            children: [
                              sectionLabels(context, AppLocalizations.of(context)!.label_recent_orders, true, 4),
                              RecentOrderSlider(orders: state.orders,)
                            ],
                          )
                      );
                    }
                  },
                ),
                const SizedBox(height: 40,),
                sectionLabels(context, AppLocalizations.of(context)!.label_map_pharmacies, false, 0),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                    ),
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: YandexMap(
                      tiltGesturesEnabled: false,
                      zoomGesturesEnabled: false,
                      rotateGesturesEnabled: false,
                      scrollGesturesEnabled: false,
                      onCameraPositionChanged: (cameraPosition, _, __) {
                        setState(() {
                          _mapZoom = cameraPosition.zoom;
                        });
                      },
                      onUserLocationAdded: (view) async {
                        // получаем местоположение пользователя
                        _userLocation = await _mapController.getUserCameraPosition();
                        // если местоположение найдено, центрируем карту относительно этой точки
                        if (_userLocation != null) {
                          await _mapController.moveCamera(
                            CameraUpdate.newCameraPosition(
                              _userLocation!.copyWith(zoom: 10),
                            ),
                            animation: const MapAnimation(
                              type: MapAnimationType.linear,
                              duration: 0.1,
                            ),
                          );
                        }
                        // меняем внешний вид маркера - делаем его непрозрачным
                        return view.copyWith(
                          pin: view.pin.copyWith(
                            opacity: 1,
                          ),
                        );
                      },
                    ),
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
