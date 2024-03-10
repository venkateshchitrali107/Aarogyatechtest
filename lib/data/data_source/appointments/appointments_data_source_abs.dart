import 'package:fpdart/fpdart.dart';

import '../../../core/core.dart';
import '../params/data_params.dart';

abstract class AppointmentsDataSource {
  Future<Either<Failure, String>> getScheduledAppointments(
      GetScheduledAppointmentsParams paramas);
  Future<Either<Failure, bool>> createPatient(
    CreatePatientParams paramas,
  );
  Future<Either<Failure, bool>> createAppointment(
    CreateAppointmentParams paramas,
  );
}
