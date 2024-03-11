import 'package:fpdart/fpdart.dart';

import '../../core/core.dart';
import '../../data/data_source/params/data_params.dart';

abstract class AppointmentsRepository {
  // Get scheduled appointments
  Future<Either<Failure, String>> getScheduledAppointments(
      GetScheduledAppointmentsParams paramas);

  // Create new patient
  Future<Either<Failure, bool>> createPatient(CreatePatientParams paramas);

  // Create new appointment
  Future<Either<Failure, bool>> createAppointment(
      CreateAppointmentParams paramas);
}
