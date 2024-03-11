import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import '../../../config/config.dart';
import '../../../core/core.dart';
import '../params/data_params.dart';
import 'appointments_data_source_abs.dart';

class AppointmentsRemoteDataSourceImpl implements AppointmentsDataSource {
  final NetworkInfoImpl networkInfoImpl;
  AppointmentsRemoteDataSourceImpl({
    required this.networkInfoImpl,
  });
  @override
  Future<Either<Failure, bool>> createAppointment(
    CreateAppointmentParams paramas,
  ) async {
    var isConnected = await networkInfoImpl.isConnected();
    if (isConnected) {
      try {
        final url = Uri.parse(
          APIendpoints().baseUrl + APIendpoints().createPatient,
        );

        // Make API call to create appointment
        final body = paramas.toMap();
        final response = await http.post(url, body: body);

        // Check if API call was successful
        return Right(response.statusCode == 200);
      } on Error catch (error) {
        return Left(ServerFailure(error.toString()));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> createPatient(
    CreatePatientParams paramas,
  ) async {
    var isConnected = await networkInfoImpl.isConnected();
    if (isConnected) {
      try {
        final url = Uri.parse(APIendpoints().baseUrl);

        // Make API call to create patient
        final body = paramas.toMap();
        final response = await http.post(url, body: body);

        // Check if API call was successful
        return Right(response.statusCode == 200);
      } on Error catch (error) {
        return Left(ServerFailure(error.toString()));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }

  @override
  Future<Either<Failure, String>> getScheduledAppointments(
    GetScheduledAppointmentsParams paramas,
  ) async {
    var isConnected = await networkInfoImpl.isConnected();
    if (isConnected) {
      try {
        final baseUrl = APIendpoints().baseUrl;
        final scheduledDate = 'scheduled_date=${paramas.scheduledDate}';
        final doctorId = 'doctor_id=${paramas.doctorId}';
        final url = Uri.parse('$baseUrl?$scheduledDate&$doctorId');

        // Make API call to get scheduled appointments
        final response = await http.get(url);

        return const Right('');
      } on Error catch (error) {
        return Left(ServerFailure(error.toString()));
      }
    } else {
      return Left(ConnectionFailure());
    }
  }
}
