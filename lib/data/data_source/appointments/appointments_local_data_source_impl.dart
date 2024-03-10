import 'package:fpdart/fpdart.dart';

import '../../../core/core.dart';
import '../params/data_params.dart';
import 'appointments_data_source.dart';

class AppointmentsLocalDataSourceImpl implements AppointmentsDataSource {
  @override
  Future<Either<Failure, bool>> createAppointment(
      CreateAppointmentParams paramas) {
    // TODO: implement createAppointment
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> createPatient(CreatePatientParams paramas) {
    // TODO: implement createPatient
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> getScheduledAppointments(
      GetScheduledAppointmentsParams paramas) {
    // TODO: implement getScheduledAppointments
    throw UnimplementedError();
  }
}
