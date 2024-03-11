import 'package:fpdart/fpdart.dart';

import '../../../core/core.dart';
import '../../../data/data_source/params/data_params.dart';
import '../../repository/appointments_repo.dart';

class CreateAppointmentUseCase
    implements UseCase<bool, CreateAppointmentParams> {
  // Repository for appointments
  final AppointmentsRepository repository;

  // Constructor to initialize repository
  CreateAppointmentUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(CreateAppointmentParams params) async {
    // Call repository to create appointment
    return await repository.createAppointment(params);
  }
}
