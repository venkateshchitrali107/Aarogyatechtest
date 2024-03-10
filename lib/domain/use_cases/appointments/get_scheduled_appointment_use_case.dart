import 'package:fpdart/fpdart.dart';

import '../../../core/core.dart';
import '../../../data/data_source/params/get_scheduled_appointment_params.dart';
import '../../repository/appointments_repo.dart';

class GetScheduledAppointmentsUseCase
    implements UseCase<String, GetScheduledAppointmentsParams> {
  final AppointmentsRepository repository;

  GetScheduledAppointmentsUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(
      GetScheduledAppointmentsParams params) async {
    return await repository.getScheduledAppointments(params);
  }
}
