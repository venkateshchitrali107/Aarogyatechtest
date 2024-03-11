import 'package:fpdart/fpdart.dart';

import '../../../core/core.dart';
import '../params/data_params.dart';
import 'appointments_data_source.dart';

class AppointmentsLocalDataSourceImpl implements AppointmentsDataSource {
  @override
  Future<Either<Failure, bool>> createAppointment(
      CreateAppointmentParams paramas) {
    // TODO: implement createAppointment //add inline comment
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> createPatient(CreatePatientParams paramas) {
    // TODO: implement createPatient //add inline comment
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> getScheduledAppointments(
      GetScheduledAppointmentsParams paramas) {
    // TODO: implement getScheduledAppointments //add inline comment
    throw UnimplementedError();
  }
}
