import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:medical_prescription/data/data_sources/local/hive/hives.dart';
import 'package:medical_prescription/data/data_sources/remote/auth/auth_api_service.dart';
import 'package:medical_prescription/data/data_sources/remote/medicament/medicament_api_service.dart';
import 'package:medical_prescription/data/data_sources/remote/order/order_api_service.dart';
import 'package:medical_prescription/data/data_sources/remote/pharmacy/qr_api_service.dart';
import 'package:medical_prescription/data/data_sources/remote/prescription/prescription_api_service.dart';
import 'package:medical_prescription/data/repository/auth_repository_impl.dart';
import 'package:medical_prescription/data/repository/medicament_repository_impl.dart';
import 'package:medical_prescription/data/repository/order_repository_impl.dart';
import 'package:medical_prescription/data/repository/pharmacy/qr_repository_impl.dart';
import 'package:medical_prescription/data/repository/prescription_repository_impl.dart';
import 'package:medical_prescription/domain/entities/cart/cart.dart';
import 'package:medical_prescription/domain/entities/medicament/medicament.dart';
import 'package:medical_prescription/domain/entities/tag/tag.dart';
import 'package:medical_prescription/domain/entities/token/token.dart';
import 'package:medical_prescription/domain/repository/medicament_repository.dart';
import 'package:medical_prescription/domain/repository/order_repository.dart';
import 'package:medical_prescription/domain/repository/pharmacy/qr_repository.dart';
import 'package:medical_prescription/domain/repository/prescription_repository.dart';
import 'package:medical_prescription/domain/usecases/get_medicaments_by_category.dart';
import 'package:medical_prescription/domain/usecases/get_medicaments_by_tag.dart';
import 'package:medical_prescription/domain/usecases/get_prescriptions.dart';
import 'package:medical_prescription/domain/usecases/login_user.dart';
import 'package:medical_prescription/domain/usecases/order/create_order.dart';
import 'package:medical_prescription/domain/usecases/order/get_orders_by_patient.dart';
import 'package:medical_prescription/domain/usecases/pharmacy/scan_qrcode_usecase.dart';
import 'package:medical_prescription/domain/usecases/registration_user.dart';
import 'package:medical_prescription/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:medical_prescription/presentation/bloc/medicament/medicament_bloc.dart';
import 'package:medical_prescription/presentation/bloc/order/order_bloc.dart';
import 'package:medical_prescription/presentation/bloc/pharmacy/qr_bloc/qr_bloc.dart';
import 'package:medical_prescription/presentation/bloc/prescription/prescription_bloc.dart';
import 'domain/repository/auth_repository.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async{
  sl.registerSingleton<Dio>(Dio());

  await Hive.initFlutter();
  Hive.registerAdapter(TokenEntityAdapter());
  Hive.registerAdapter(CartEntityAdapter());
  Hive.registerAdapter(MedicamentEntityAdapter());
  Hive.registerAdapter(TagEntityAdapter());
  await Hive.openBox<TokenEntity>(Hives.boxToken);
  await Hive.openBox<CartEntity>(Hives.boxCart);
  //auth
  sl.registerSingleton<AuthApiService>(AuthApiService(sl()));
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));
  sl.registerSingleton<LoginUserUseCase>(LoginUserUseCase(sl()));
  sl.registerSingleton<RegisterUserUseCase>(RegisterUserUseCase(sl()));
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl(), sl()));
  //prescriptions
  sl.registerSingleton<PrescriptionApiService>(PrescriptionApiService(sl()));
  sl.registerSingleton<PrescriptionRepository>(PrescriptionRepositoryImpl(sl()));
  sl.registerSingleton<GetPrescriptionsUseCase>(GetPrescriptionsUseCase(sl()));
  sl.registerFactory<PrescriptionBloc>(() => PrescriptionBloc(sl()));
  //medicaments
  sl.registerSingleton<MedicamentApiService>(MedicamentApiService(sl()));
  sl.registerSingleton<MedicamentRepository>(MedicamentRepositoryImpl(sl()));
  sl.registerSingleton<GetMedicamentsByTagUseCase>(GetMedicamentsByTagUseCase(sl()));
  sl.registerSingleton<GetMedicamentsByCategoryUseCase>(GetMedicamentsByCategoryUseCase(sl()));
  sl.registerFactory<MedicamentBloc>(() => MedicamentBloc(sl(), sl()));
  //orders
  sl.registerSingleton<OrderApiService>(OrderApiService(sl()));
  sl.registerSingleton<OrderRepository>(OrderRepositoryImpl(sl()));
  sl.registerSingleton<CreateOrderUseCase>(CreateOrderUseCase(sl()));
  sl.registerSingleton<GetOrdersByPatientUseCase>(GetOrdersByPatientUseCase(sl()));
  sl.registerFactory<OrderBloc>(() => OrderBloc(sl(), sl()));
  //qr
  sl.registerSingleton<QrApiService>(QrApiService(sl()));
  sl.registerSingleton<QrRepository>(QrRepositoryImpl(sl()));
  sl.registerSingleton<ScanQrCodeUseCase>(ScanQrCodeUseCase(sl()));
  sl.registerFactory<QrBloc>(() => QrBloc(sl()));

}