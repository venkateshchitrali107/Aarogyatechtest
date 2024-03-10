import 'package:equatable/equatable.dart';

class GetScheduledAppointmentsParams extends Equatable {
  final String scheduledDate;
  final String doctorId;
  const GetScheduledAppointmentsParams({
    required this.scheduledDate,
    required this.doctorId,
  });

  @override
  List<Object?> get props => [scheduledDate, doctorId];
}
