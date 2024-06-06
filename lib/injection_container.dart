import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:medical_prescription/data/data_sources/local/hive/hives.dart';
import 'package:medical_prescription/data/data_sources/remote/auth/auth_api_service.dart';
import 'package:medical_prescription/data/data_sources/remote/prescription/prescription_api_service.dart';
import 'package:medical_prescription/data/repository/auth_repository_impl.dart';
import 'package:medical_prescription/data/repository/prescription_repository_impl.dart';
import 'package:medical_prescription/domain/entities/cart.dart';
import 'package:medical_prescription/domain/entities/medicament.dart';
import 'package:medical_prescription/domain/entities/token.dart';
import 'package:medical_prescription/domain/repository/prescription_repository.dart';
import 'package:medical_prescription/domain/usecases/get_prescriptions.dart';
import 'package:medical_prescription/domain/usecases/login_user.dart';
import 'package:medical_prescription/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:medical_prescription/presentation/bloc/prescription/prescription_bloc.dart';
import 'domain/repository/auth_repository.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async{
  sl.registerSingleton<Dio>(Dio());

  await Hive.initFlutter();
  Hive.registerAdapter(TokenEntityAdapter());
  Hive.registerAdapter(CartEntityAdapter());
  Hive.registerAdapter(MedicamentEntityAdapter());
  await Hive.openBox<TokenEntity>(Hives.boxToken);
  await Hive.openBox<CartEntity>(Hives.boxCart);

  sl.registerSingleton<AuthApiService>(AuthApiService(sl()));
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));
  sl.registerSingleton<LoginUserUseCase>(LoginUserUseCase(sl()));
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl()));
  sl.registerSingleton<PrescriptionApiService>(PrescriptionApiService(sl()));
  sl.registerSingleton<PrescriptionRepository>(PrescriptionRepositoryImpl(sl()));
  sl.registerSingleton<GetPrescriptionsUseCase>(GetPrescriptionsUseCase(sl()));
  sl.registerFactory<PrescriptionBloc>(() => PrescriptionBloc(sl()));
}