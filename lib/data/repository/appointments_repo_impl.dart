import 'package:fpdart/fpdart.dart';

import '../../core/core.dart';
import '../../domain/repository/domain_repository.dart';
import '../data_source/appointments/appointments_data_source.dart';
import '../data_source/params/data_params.dart';

class AppointmentsRepositoryImpl implements AppointmentsRepository {
  final AppointmentsDataSource dataSource;

  AppointmentsRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, bool>> createAppointment(
      CreateAppointmentParams paramas) async {
    return await dataSource.createAppointment(paramas);
  }

  @override
  Future<Either<Failure, bool>> createPatient(
      CreatePatientParams paramas) async {
    return await dataSource.createPatient(paramas);
  }

  @override
  Future<Either<Failure, String>> getScheduledAppointments(
      GetScheduledAppointmentsParams paramas) async {
    return await dataSource.getScheduledAppointments(paramas);
  }
}
