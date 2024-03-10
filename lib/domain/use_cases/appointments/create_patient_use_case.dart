import 'package:fpdart/fpdart.dart';

import '../../../core/core.dart';
import '../../../data/data_source/params/data_params.dart';
import '../../repository/appointments_repo.dart';

class CreatePatientUseCase implements UseCase<bool, CreatePatientParams> {
  final AppointmentsRepository repository;

  CreatePatientUseCase(this.repository);

  @override
  Future<Either<Failure, bool>> call(CreatePatientParams params) async {
    return await repository.createPatient(params);
  }
}
