import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../../data/data_source/appointments/appointments_data_source.dart';
import '../../data/repository/data_repository.dart';
import '../../domain/use_cases/appointments/appointments_use_case.dart';
import '../network/network.dart';

final sl = GetIt.instance;

// Initializes dependency injection
Future<void> init() async {
  // Creates http client
  sl.registerLazySingleton(
    () => http.Client(),
  );

  // Creates network info implementation
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      sl(),
    ),
  );

  // Creates appointments remote data source
  sl.registerLazySingleton<AppointmentsRemoteDataSourceImpl>(
    () => AppointmentsRemoteDataSourceImpl(
      networkInfoImpl: sl(),
    ),
  );

  // Creates appointments local data source
  sl.registerLazySingleton<AppointmentsLocalDataSourceImpl>(
    () => AppointmentsLocalDataSourceImpl(),
  );

  // Creates appointments repository
  sl.registerLazySingleton<AppointmentsRepositoryImpl>(
    () => AppointmentsRepositoryImpl(
      dataSource: sl(),
    ),
  );

  // Creates get scheduled appointments use case
  sl.registerLazySingleton<GetScheduledAppointmentsUseCase>(
    () => GetScheduledAppointmentsUseCase(
      sl(),
    ),
  );

  // Creates create appointment use case
  sl.registerLazySingleton<CreateAppointmentUseCase>(
    () => CreateAppointmentUseCase(
      sl(),
    ),
  );

  // Creates create patient use case
  sl.registerLazySingleton<CreatePatientUseCase>(
    () => CreatePatientUseCase(
      sl(),
    ),
  );
}
