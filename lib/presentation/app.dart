import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:medical_prescription/core/util/l10n/l10n.dart';
import 'package:medical_prescription/core/util/theme/AppTheme.dart';
import 'package:medical_prescription/data/data_sources/local/hive/box_helper.dart';
import 'package:medical_prescription/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:medical_prescription/presentation/bloc/catalogue_bloc/catalogue_bloc.dart';
import 'package:medical_prescription/presentation/bloc/medicament/medicament_bloc.dart';
import 'package:medical_prescription/presentation/bloc/order/order_bloc.dart';
import 'package:medical_prescription/presentation/bloc/pharmacy/qr_bloc/qr_bloc.dart';
import 'package:medical_prescription/presentation/bloc/prescription/prescription_bloc.dart';
import 'package:medical_prescription/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:medical_prescription/presentation/pages/patient/auth_page.dart';
import 'package:medical_prescription/presentation/screens/patient/patient_app.dart';
import 'package:medical_prescription/presentation/screens/pharmacy/pharmacy_app.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../injection_container.dart';
import 'bloc/cart_bloc/cart_bloc.dart';

final ValueNotifier selectedIndexGlobalPharmacy = ValueNotifier(0);

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(sl(),sl())
        ),
        BlocProvider<PrescriptionBloc>(
            create: (context) => PrescriptionBloc(sl())
        ),
        BlocProvider<SearchBloc>(
            create: (context) => SearchBloc()
        ),
        BlocProvider<CatalogueBloc>(
          create: (context) => CatalogueBloc(),
        ),
        BlocProvider<CartBloc>(
          create: (context) => CartBloc(),
        ),
        BlocProvider<MedicamentBloc>(
          create: (context) => MedicamentBloc(sl(), sl()),
        ),
        BlocProvider<OrderBloc>(
            create: (context) => OrderBloc(sl(), sl())
        ),
        BlocProvider<QrBloc>(
            create: (context) => QrBloc(sl())
        ),
      ],
      child: const AppView()
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  late CartBloc cartBloc;
  late AuthBloc authBloc;
  
  @override
  void initState() {
    authBloc = context.read<AuthBloc>();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        supportedLocales: L10n.all,
        locale: const Locale('kk'),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate
        ],
        home: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if(BoxHelper.hasToken() && !JwtDecoder.isExpired(BoxHelper.getToken()!.access)) {
              Map<String, dynamic> decodedToken = JwtDecoder.decode(BoxHelper.getToken()!.access);
              return SafeArea(child: decodedToken["roles"][0]=="ROLE_USER"? const PatientApp() : const PharmacyApp());
            }else{
              return AuthPage();
            }
          },
        )
      ),
    );
  }
}

