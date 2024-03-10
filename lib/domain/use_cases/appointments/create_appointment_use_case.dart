import 'package:fpdart/fpdart.dart';

import '../../../core/core.dart';
import '../../../data/data_source/params/data_params.dart';
import '../../repository/appointments_repo.dart';

class CreateAppointmentUseCase
    implements UseCase<bool, CreateAppointmentParams> {
  final AppointmentsRepository repository;

  CreateAppointmentUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(CreateAppointmentParams params) async {
    return await repository.createAppointment(params);
  }
}
